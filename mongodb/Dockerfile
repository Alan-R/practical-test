# vim: smartindent tabstop=4 shiftwidth=4 expandtab number colorcolumn=80
# Based off ideas from http://www.tothenew.com/blog/mongodb-replica-set-using-docker-networking-and-docker-compose/
#
# Dockerfile to build MongoDB replica set for use with Docker compose
#
# Author: Alan Robertson <alanr@root.sh>
# Copyright (C) 2016 - Alan Robertson <alanr@root.sh>
#
# This software is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with the Assimilation Project software. 
# If not, see http://www.gnu.org/licenses/
#
#
#   FIXME: Ought to add independent volumes for the MongoDB data
#          so things don't get lost if we shut everything down
#          and things replicate faster if a node goes down and comes back up
#
FROM mongo
MAINTAINER Alan Robertson <alanr@root.sh>
ADD mongod.conf /etc/mongod.conf
ADD startup.sh /root/startup.sh
CMD ["bash", "/root/startup.sh"]
