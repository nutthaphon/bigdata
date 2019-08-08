FROM nutthaphon/oozie:latest

LABEL maintainer="nutthaphon@gmail.com"

USER root

RUN apt-get update && apt-get install -y unzip

USER oozie

ENV JAVA_HOME /jdk
ENV OOZIE_HOME /oozie

WORKDIR /oozie

ADD ext-2.2.zip libext/

EXPOSE 22 11000

CMD ["bin/oozied.sh", "run"]