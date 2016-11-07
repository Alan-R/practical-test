# vim: smartindent tabstop=4 shiftwidth=4 expandtab number colorcolumn=80
#
# Dockerfile to build Nodejs Express Mongoose Demo
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
#   Dependencies:
#       - ubuntu:latest base package
#       - version 6.x of Node.js - from node.js repository
#       - Latest version of express/mongoose demo
#       - npm and curl Ubuntu packages
#       - demo.env file - containing demo definitions and credentials
#
#   Things that may need to change in the future:
#
#   Contents of $PWD/demo.env to update to our various client ids and
#       secret keys.
#   Note that storing these credentials in github is a *really* bad idea...
#
#
#   FIXME: updating to run things in Docker not as root is a good idea
#          even though Docker has historically claimed this isn't an issue...
#
#   FIXME: have not nailed down specific tested versions of these tools
#
#   FIXME: NPM version is not the same as node.js version
#
#
######################################################
#   Install required base packages
######################################################
FROM ubuntu:latest
#FROM ubuntu:wily
MAINTAINER Alan Robertson <alanr@root.sh>
#
#   Dependency definitions
#
ENV GIT https://github.com
ENV NODEDEMO ${GIT}/madhums/node-express-mongoose-demo/archive/master.tar.gz
ENV NODESETUP https://deb.nodesource.com/setup_6.x
ENV PACKAGES curl npm
#
#
ENV INSTALL apt-get -y --no-install-recommends install
RUN apt-get update
RUN mkdir /tmp/demo
WORKDIR /tmp/demo
RUN ${INSTALL} ${PACKAGES}
#   This demo requires a newer version of Node.js than Ubuntu provides
#   so we pull the latest 6.x version directly from the Node.js repository
RUN curl -sL $NODESETUP | bash -
RUN apt-get install -y nodejs
ADD $NODEDEMO demo.tar.gz
#
#
RUN tar xvzf demo.tar.gz
RUN mv node-express-mongoose* src
COPY demo.env /tmp/demo/src/.env
WORKDIR /tmp/demo/src
RUN npm install
RUN echo "===== Demo Credentials are in file checksummed below ======"
RUN md5sum /tmp/demo/src/.env
RUN nodejs --version
#RUN $INSTALL bind9-host
# Tests require MongoDB to be installed on localhost...
#RUN ${INSTALL} mongodb
#RUN /etc/init.d/mongodb start && sleep 30 && (npm start &) && npm test
# Note that there are 11 tests - and there's a long pause after the 11th test
# passes. This is "normal"...
ENTRYPOINT cd /tmp/demo/src; while sleep 10; do /usr/bin/node server.js; echo OOPS $?; done
