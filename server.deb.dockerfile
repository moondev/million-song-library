FROM maven:3.3.9-jdk-8


RUN apt-get update

RUN apt-get install -y curl git

RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh

RUN chmod +x nodesource_setup.sh

RUN ./nodesource_setup.sh

RUN apt-get install -y nodejs python

RUN apt-get install -y build-essential

COPY . /msl

WORKDIR /msl/server

RUN cd /msl/msl-pages; npm install -g bower; npm install; bower install --allow-root

RUN mvn clean compile



CMD ["npm", "run", "serve-all"]