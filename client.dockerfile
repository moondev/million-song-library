FROM centos:7

#RUN yum install -y java-1.8.0-openjdk.x86_64

RUN yum install -y wget which curl

#RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo

#RUN yum install -y apache-maven

RUN curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -

RUN yum -y install nodejs git bzip2 socat

RUN yum -y install gcc-c++ make

RUN yum -y install ruby python;

RUN yum -y install gcc gcc-c++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel

RUN yum -y install ruby-rdoc ruby-devel

RUN yum -y install rubygems

RUN gem install asciidoctor

COPY . /msl

RUN rm /msl/msl-pages/package.json

COPY ./client-package.json /msl/msl-pages/package.json

WORKDIR /msl/msl-pages

RUN npm install -g swagger-parser; npm install -g node-gyp

#RUN npm run parse-swagger-src

RUN cd /msl/msl-pages; npm install -g bower; npm install; bower install --allow-root

RUN npm install -g -y protractor && npm install -g -y selenium-webdriver
# RUN echo "\n" | alternatives --config java

# RUN echo "\n" | alternatives --config javac

#RUN which java


#RUN cd /msl/server; mvn clean compile -X

#COPY . /msl

#RUN cd /msl/msl-pages; npm install -g bower; npm install; bower install --allow-root

#WORKDIR /msl/msl-pages

#RUN npm install -g -y protractor && npm install -g -y selenium-webdriver

CMD ["npm", "run", "full-dev"]