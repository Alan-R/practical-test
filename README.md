This is a collection of node.js test code and so on for Docker.

To build and install it, run the script BUILDME.

It has the following characteristics:
 - It's created by docker compose
 - It is based off some Express-Mongoose demo code
 - It includes an NGINX reverse proxy front end and a MongoDB back end.
 
There is also a script called swarmservices which was an attempt to get all this to work under Docker swarm. The problem I ran into there was properly initializing the MongoDB cluster. An attempt was made to also use Docker deploy - but that is experimental and could not support the NGINX auto-configuration that we use.
 
 The docker-compose.yml file contains the Docker compose configuration
 The following directories are also included:
  - mongodb - a Dockerfile for creating a MongoDB docker image
  - node-demo - a Dockerfile for creating the Express-Mongoose demo docker image
  
This proved to be an interesting exercise - since I had no prior experience with MongoDB, or any kind of Docker orchestration, and only a tiny bit of experience with NGINX. You can find my notes of learning about all these things [on Trello](https://trello.com/b/rIKiAz6C).

The docker-compose file format is useful and interesting (beautiful even), but unfortunately does not support multiple host configurations.

Docker swarm has advantages in terms of higher levels of redundancy possible, because of built-in load balancing - but there was an issue that came up I did not have time to resolve. The swarmservices script was my attempt to get swarm with docker service up and going. If I hadn't barked up quite so many of the wrong trees in my learning experience, I probably could have gotten it working. (knowing more about MongoDB wouldn't have hurt a thing either).

I made no attempt to do this on Kubernetes. In retrospect, this would have been a better choice. On the other hand, I learned a lot about these new Docker features (including some experimental ones).
