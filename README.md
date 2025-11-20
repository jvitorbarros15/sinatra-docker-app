# Sinatra Docker App

This project is my first practical experience using Docker.  
It contains a small Sinatra application that prints a simple message to confirm that everything is running correctly inside a container.

The goal is to learn how to:

- Write a basic Sinatra app
- Build a Docker image from a Ruby project
- Run the app inside a container
- Map container ports to the host
- Understand the Docker workflow from build to execution

This is a beginner friendly repo for learning and testing.

## Requirements

- Docker installed on your machine
- Ruby is optional on the host since the app runs inside Docker

## Project Structure

sinatra_app/
    config.ru
    Dockerfile
    Gemfile
    Gemfile.lock
    hello.rb

## The Sinatra App

The hello.rb file contains a simple route:

require "sinatra"

set :bind, "0.0.0.0"
set :port, 4567

get "/" do
  "It works!"
end

## Dockerfile

The Dockerfile installs Ruby, copies the project, installs gems, exposes port 4567, and runs the app.

FROM ruby:3.2

WORKDIR /code
COPY . /code

RUN bundle install

EXPOSE 4567

CMD ["ruby", "hello.rb", "-o", "0.0.0.0", "-p", "4567"]


## What I Learned

- How Docker builds an image using a Dockerfile
- How to copy code into an image
- How to install gems during the build stage
- How to forward ports from container to host
- How to debug container output
- Why binding to 0.0.0.0 is required inside containers
- How to remove containers and images to start fresh

# Useful Docker commands:

docker image ls or docker container ls -> to see images and containers
"docker build --tag <Name> ." builds and image in your current dir with the name hello
docker run --interactive --tty <ID> /bin/bash. To run the container interactively
docker exec -it <ID> bash to going inside a running container

sbcl run the lisp interpreter
(format t "hello, world!") to print hello world in lisp
(exit) or (quit) to exit the lisp interpreter

docker stop <ID> to stop the running container
docker rmi -f <ID> to remove the image

docker run -p 4567:4567 <ID> to run the container mapping the port 4567 of the container to port 4567 on the host machine
docker ps shows running containers
docker ps -a shows all containers
docker rm -f $(docker ps -aq) to remove all containers
docker rmi -f $(docker images -aq) to remove all images

## Future Ideas

- Add HTML templates
- Add a second route
- Add Docker Compose
- Add logging
- Deploy the container to a cloud service
