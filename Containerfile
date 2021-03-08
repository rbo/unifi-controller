FROM docker.io/library/ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y curl gnupg openjdk-8-jre
RUN curl -# -L -o /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
RUN curl -# -L https://www.mongodb.org/static/pgp/server-3.4.asc  | apt-key add -
RUN echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN echo 'deb [arch=armhf]  https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list
RUN apt-get update
RUN apt-get install -y unifi 
