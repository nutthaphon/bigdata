FROM nutthaphon/oozie:5.1.0-jdk8

LABEL maintainer="nutthaphon@gmail.com"

USER oozie

ENV JAVA_HOME /jdk
ENV OOZIE_HOME /oozie

WORKDIR /oozie

ADD ext-2.2.zip libext/

EXPOSE 22 11000

CMD ["bin/oozied.sh", "run"]