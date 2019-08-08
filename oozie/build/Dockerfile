FROM nutthaphon/oozie:latest

LABEL maintainer="nutthaphon@gmail.com"

USER root

RUN apt-get update && apt-get install -y	\
								unzip		\
								wget

USER oozie

ENV JAVA_HOME /jdk
ENV OOZIE_HOME /oozie

WORKDIR /oozie

RUN wget http://archive.cloudera.com/gplextras/misc/ext-2.2.zip -O libext/ext-2.2.zip

EXPOSE 22 11000

CMD ["bin/oozied.sh", "run"]