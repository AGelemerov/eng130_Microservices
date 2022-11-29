# Microservices
Microservices are an architectural and organizational approach to software development where software is composed of small independent services that communicate over well-defined APIs. These services are owned by small, self-contained teams.

## FOR SHAHRUKH
```
docker run -d -p 80:3000 agelemerov/eng130-angel-docker:latest
```


![micro-over-years](images/microservices-over-the-years.png)

Microservices - also known as the microservice architecture - is an architectural style that structures an application as a collection of services that are:
- Highly maintainable and testable
- Loosely coupled
- Independently deployable
- Organized around business capabilities
- Owned by a small team
- The microservice architecture enables the rapid, frequent and reliable delivery of large, complex applications. It also enables an organization to evolve its technology stack.
## Characteristics of Microservices

### Autonomous
- Each component service in a microservices architecture can be developed, deployed, operated, and scaled without affecting the functioning of other services. Services do not need to share any of their code or implementation with other services. Any communication between individual components happens via well-defined APIs.

### Specialized
- Each service is designed for a set of capabilities and focuses on solving a specific problem. If developers contribute more code to a service over time and the service becomes complex, it can be broken into smaller services.
![monolith-vs-microservices](images/monolith-vs-microservice.png)

## Benefits of Microservices

### Agility
  - Microservices foster an organization of small, independent teams that take ownership of their services. Teams act within a small and well understood context, and are empowered to work more independently and more quickly. This shortens development cycle times. You benefit significantly from the aggregate throughput of the organization.

### Flexible Scaling
  - Microservices allow each service to be independently scaled to meet demand for the application feature it supports. This enables teams to right-size infrastructure needs, accurately measure the cost of a feature, and maintain availability if a service experiences a spike in demand.

### Easy Deployment
  - Microservices enable continuous integration and continuous delivery, making it easy to try out new ideas and to roll back if something doesn’t work. The low cost of failure enables experimentation, makes it easier to update code, and accelerates time-to-market for new features.

### Technological Freedom
  - Microservices architectures don’t follow a “one size fits all” approach. Teams have the freedom to choose the best tool to solve their specific problems. As a consequence, teams building microservices can choose the best tool for each job.

### Reusable Code
  - Dividing software into small, well-defined modules enables teams to use functions for multiple purposes. A service written for a certain function can be used as a building block for another feature. This allows an application to bootstrap off itself, as developers can create new capabilities without writing code from scratch.

### Resilience
  - Service independence increases an application’s resistance to failure. In a monolithic architecture, if a single component fails, it can cause the entire application to fail. With microservices, applications handle total service failure by degrading functionality and not crashing the entire application.

## Docker
Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly.

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

![docker](images/docker.png)

## Docker setup
### All the same

- Docker Daemon
- Docker Host
-Docker Engine


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

## Useful commands

### To delete container:
- `docker rm CONTAINERID -f`

### To run in detached mode:
- `docker run -d -p 80:80 nginx`

### To see logs
- `docker logs CONTAINERID`

### List currently running containers
- `docker ps`

### List all images
- `docker images`

### Commit changes to image
- `docker commit NAME/ID DOCKERHUB_REPO`

### Push changes to Dockerhub (after commit)
- `docker push DOCKERHUB_REPO`
### Tag an image
Used to make different versions of the same image
- `docker tag CURRENT_TAG FUTURE_TAG`

### Rename a container
- `docker rename OLD_NAME NEW_NAME`

### Build a new image
- `docker build -t DOCKERHUB_REPO DOCKERFILE_LOCATION`


### Stop a running docker container
- `docker stop ID/NAME`

### Remove all running container instances
- `docker rm $(docker ps -a -q)`

### Upload a file:
- `docker cp C:/Users/angel/Desktop/Microservices/images/resume.css  70b047cb03e3:/usr/share/nginx/html`


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

## Setup nginx in Docker container
1. Create dockerfile

```Dockerfile
  # docker run -d -p 80:80 nginx
  FROM nginx
  #who is creating it
  LABEL MAINTAINER=eng130-angel
  # created index.html profile -> copy to container
  # default location -> usr/share/nginx/html/
  COPY index.html /usr/share/nginx/html/
  # commit
  # push
  # docker run -d -p 80:80 name
  #       launch nginx
  #       port number must be specified
  EXPOSE 80

  #launch server
  CMD ["nginx", "-g", "daemon off;"]
```

2. Build an image
   1. `docker build -t agelemerov/eng130-angel-docker .` - where . is the Dockerfile locaiton
3. Commit changes
   1. `docker commit inspiring_diffie agelemerov/eng130-angel-docker:latest`
4. Push changes to DockerHub
   1. `docker push agelemerov/eng130-angel-docker:latest`
5. Run the image
   1. `docker run -d -p 80:80 agelemerov/eng130-angel-docker`

## Setup NodeApp in Docker container

1. Create new folder
2. Create new Dockerfile in folder
3. Add any file you want to that folder (in this case app and environment folders)
4. To the Dockerfile add the following script:

```Dockerfile
  FROM nginx

  LABEL MAINTAINER=eng130-angel

  COPY app /home/
  COPY environment /home/

  EXPOSE 80
  EXPOSE 3000

  RUN apt-get update
  RUN apt-get install -y
  RUN apt-get install software-properties-common -y
  RUN apt-get install npm -y

  CMD ["nginx", "-g", "daemon off;"]
  WORKDIR /home/app
  RUN npm install
  CMD ["npm", "start"]
```

5. Build the node app
   1. `docker build -t nodeapp .`
6. Run the app to make sure it works locally
   1. `docker run -d -p 80:3000 nodeapp`
7. Stop the container
   1. `docker stop ID`
8. Commit the changes we made to "node"
   1. `docker commit ID agelemerov/eng130-angel-docker:latest`
9. Push the changes
   1.  `docker push agelemerov/eng130-angel-docker:latest`
10. To check if all is good
    1.  Delete the image
        1.  `docker rm ID -f`
    2.  Run the image from DockerHub
        1.  `docker run -d -p 80:3000 agelemerov/eng130-angel-docker:latest`
11. If you now go to "localhost" in your browser, you should see your app

## Docker compose file
```yaml
   volumes:
   db:
   services:
   db:
      container_name: db
      image: mongo:4.0.4
      ports:
         - "27017:27017"
      volumes:
         - ./db/mongod.conf:/etc/mongod.conf

   app:
      container_name: app
      build: ./app
      restart: always
      ports:
         - "80:3000"
      environment:
      # export an environment variable containing the ip of the db instance
         - DB_HOST=mongodb://db:27017/posts
      depends_on:
         - db
```


Testing merge and tests