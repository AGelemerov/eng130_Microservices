# Microservices

![micro-over-years](images/microservices-over-the-years.png)

Microservices - also known as the microservice architecture - is an architectural style that structures an application as a collection of services that are:
- Highly maintainable and testable
- Loosely coupled
- Independently deployable
- Organized around business capabilities
- Owned by a small team
- The microservice architecture enables the rapid, frequent and reliable delivery of large, complex applications. It also enables an organization to evolve its technology stack.
![monolith-vs-microservices](images/monolith-vs-microservice.png)

### Benefits of Microservices

- Improved Scalability
- Better Fault Isolation for More Resilient Applications
- Programming Language and Technology Agnostic
- Better Data Security and Compliance
- Faster Time to Market and “Future-Proofing”
- Greater Business Agility and Support for DevOps
- Support for Two-Pizza Development Teams
## Docker
Docker is a platform designed to help developers build, share, and run modern applications. 

### What is a container?
A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.
![containers-vms](images/containers-vms.png)

### Benefits of Docker
The benefits of Docker in building and deploying applications are many:

- Caching a cluster of containers
- Flexible resource sharing
- Scalability - many containers can be placed in a single host
- Running your service on hardware that is much cheaper than standard servers
- Fast deployment, ease of creating new instances, and faster migrations.
- Ease of moving and maintaining your applications
- Better security, less access needed to work with the code running inside containers, and fewer software dependencies

## Docker setup

Docker Daemon
Docker Host
Docker Engine
All the same

1. Check connection - `docker pull hello-world` (case sensitive)
2. If you are getting an error similar to this:
```
Using default tag: latest
error during connect: In the default daemon configuration on Windows, the docker client must be run with elevated privileges to connect.: Post "http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/images/create?fromImage=hello-world&tag=latest": open //./pipe/docker_engine: The system cannot find the file specified.
```

3. Make sure you are logged into docker `docker login`
4. Make sure you are running terminal in admin mode
5. If you have done both run the following command `alias docker="winpty docker"`
6. `docker run`
   
### Ghost
Testing microservice
- If you are getting this error:
  ```
    connect ECONNREFUSED 127.0.0.1:3306
    "Unknown database error"
  ```

To delete container:
- `docker rm CONTAINERID -f`

To run in detached mode:
`docker run -d -p 80:80 nginx`

To see logs
`docker logs CONTAINERID`


## Host nginx
- `docker run -d -p 80:80 nginx`
- `docker ps` copy name of container (at the end)
- `docker rename (name of container)`
- Go to dockerhub
- Create a repository
- Name it and create it

- In GitBash
- `docker tag nginx:latest agelemerov/eng130-angel-docker:profile`
- `docker push agelemerov/eng130-angel-docker:profile`

## To upload a file:
- `docker cp C:/Users/angel/Desktop/Microservices/images/resume.css  70b047cb03e3:/usr/share/nginx/html`