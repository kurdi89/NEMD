# in container : 
```
docker run -d --name my-mongodb mongo
docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp nemd_node
```
# tear down :
```
docker-compose down
```
# tear down and remove :
```
docker-compose  down --volumes
```




# out of container : 
```
yarn start or npm start
```