# netFortune
[![Build Status](https://travis-ci.org/jhc-at-home/netFortune.svg?branch=master)](https://travis-ci.org/jhc-at-home/netFortune)


A learning project to develop a networked "fortune" clone in Haskell.

Github repository of the app: 
````
https://github.com/ArtemAlagizov/net-fortune
````
Docker container with the app: 
````
https://hub.docker.com/r/alagiz/net-fortune/
````

# Usage with docker
* Run
```
$ docker pull alagiz/net-fortune
```
```
$ docker run -p 8080:8080 net-fortune
```
* Visit http://localhost:8080/fortune or http://host-ip:8080/fortune
  * To get docker ip run
    ```
    $ docker-machine env
    ```

# Usage without docker

* Have stack installed
    ```
    https://docs.haskellstack.org/en/stable/README/
    ```
* Run 
    ```
    $ stack build
    ```
    ```
    $ stack exec netFortune-exe
    ```
* Visit http://localhost:8080/fortune
