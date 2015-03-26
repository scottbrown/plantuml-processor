FROM ubuntu:latest
MAINTAINER Scott Brown

# install java 8
RUN apt-get install -qq -y software-properties-common
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get update -qq
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -qq -y oracle-java8-installer ca-certificates

# add the plantuml binary
RUN mkdir /processor
ADD resources/plantuml.8021.jar /processor/

ENTRYPOINT java -jar /processor/plantuml.8021.jar -output /outbox /inbox/*

