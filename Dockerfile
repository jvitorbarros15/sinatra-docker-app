# Base Image from Ruby:Version
FROM ruby:3.2

# Set working directory
WORKDIR /code
COPY . /code
RUN bundle install

# Expose port 4567 to the Docker host, so we can access it from the outside
EXPOSE 4567

CMD ["bundle", "exec", "ruby", "hello.rb", "-o", "0.0.0.0", "-p", "4567"]

# Useful Docker commands:

# docker image ls `or docker container ls - to see images and containers
# "docker build --tag <Name> ." builds and image in your current dir with the name hello
# docker run --interactive --tty <ID> /bin/bash. To run the container interactively
# docker exec -it <ID> bash to going inside a running container

# sbcl run the lisp interpreter
# (format t "hello, world!") to print hello world in lisp
# (exit) or (quit) to exit the lisp interpreter

# docker stop <ID> to stop the running container
# docker rmi -f <ID> to remove the image

# docker run -p 4567:4567 <ID> to run the container mapping the port 4567 of the container to port 4567 on the host machine

# docker ps shows running containers
# docker ps -a shows all containers
# docker rm -f $(docker ps -aq) to remove all containers
# docker rmi -f $(docker images -aq) to remove all images

