FROM ubuntu:xenial

RUN apt-get update

RUN apt-get install -y curl git

RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh

RUN chmod +x nodesource_setup.sh

RUN ./nodesource_setup.sh

RUN apt-get install -y nodejs python

RUN apt-get install -y build-essential

COPY . /msl

RUN cd /msl/msl-pages; npm install -g bower; npm install; bower install --allow-root

WORKDIR /msl/msl-pages

RUN npm install -g -y protractor && npm install -g -y selenium-webdriver

CMD ["npm", "run", "full-dev"]