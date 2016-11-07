#!/bin/bash
# vim: smartindent tabstop=4 shiftwidth=4 expandtab number colorcolumn=80
set -x
MONGO_LOG="/var/log/mongodb/mongod.log"
MONGO="/usr/bin/mongo"
MONGOD="/usr/bin/mongod"
 
checkSlaveStatus(){
    SLAVE=$1
    until
        $MONGO --host $SLAVE --eval db
    do
        echo "Waiting for slave to come up..."
        sleep 15
    done
}
 
$MONGOD --fork --replSet test --noprealloc --smallfiles --logpath $MONGO_LOG
sleep 30
if
    [ "$ROLE" == "master" ]
then
    $MONGO --eval "rs.initiate()"
    for slave in ${SLAVELIST}
    do
        checkSlaveStatus ${slave}
        $MONGO --eval "rs.add(\"${slave}:27017\")"
    done
fi
# In case we get any zombies...
while sleep 30; do wait; done
