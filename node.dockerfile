# steps : 
# Build: docker build -f node.dockerfile -t node
# or use your image of node
# Build: docker build -f node.dockerfile -t abdulkurdi/node


###
# Option 1
# Start MongoDB and Node (link Node to MongoDB container with legacy linking)
# docker run -d --name my-mongodb mongo
# docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp node
# or use your image of node :
# docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp nemd_node
# docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp abdulkurdi/node

# Option 2: Create a custom bridge network and add containers into it
# docker network create --driver bridge isolated_network
# docker run -d --net=isolated_network --name mongodb mongo
# docker run -d --net=isolated_network --name nodeapp -p 3000:3000 node
# or use your image of node
# docker run -d --net=isolated_network --name nodeapp -p 3000:3000 abdulkurdi/node

####
# then 
# Seed the database with sample database
# Run: docker exec nodeapp node dbSeeder.js

### latest comments :
# docker run -d --name my-mongodb mongo
# image should be created already (if you have it) :
# docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp nemd_node
## if image was not created then run : docker-compose build, docker-compose up, then image nemd_app will be created :
# then dbSeeder :
# Run: docker exec nodeapp node dbSeeder.js

FROM node:latest

LABEL author="Abdul Kurdi"

ENV NODE_ENV=development 
ENV PORT=3000

COPY      . /var/www
WORKDIR   /var/www

RUN       npm install

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]