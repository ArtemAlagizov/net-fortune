# netFortune
[![Build Status](https://travis-ci.org/ArtemAlagizov/net-fortune.svg?branch=master)](https://travis-ci.org/ArtemAlagizov/net-fortune)


A learning project to develop a networked "fortune" clone in Haskell. The service returns a fortune prediction when a GET request is sent to it.

Docker image with the app has been hosted on the AWS ECR; at the moment it can be accessed by the link below: 

not available at the moment -> http://ec2-34-227-228-18.compute-1.amazonaws.com:8080/fortune <- not available at the moment

___

Github repository of the app: 
````
https://github.com/ArtemAlagizov/net-fortune/
````
# Design
* There are two containers - one with Haskell app, one with Postgres db
* These two containers are on the same local network (by docker-compose), so they can see and communicate with each other
* When Haskell app receives a GET request from a client, it queries the db for a random fortune and when db provides the response - returns it to the client

# Usage 
* Run
```
$ docker-compose up 
```
or to run containers in the background
```
$ docker-compose up -d
```

* Visit http://localhost:8080/fortune or http://host-ip:8080/fortune (default is http://192.168.99.100:8080/fortune)
  * To get docker host ip run
    ```
    $ docker-machine env
    ```  
