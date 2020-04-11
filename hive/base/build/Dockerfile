FROM ubuntu:18.04

LABEL maintainer="nutthaphon@gmail.com"

ARG CLUSTER_NAME=test
ARG JAVA_HOME=/java
ARG HADOOP_HOME=/hadoop
ARG HIVE_HOME=/hive
ARG HADOOP_SOURCE=https://www-eu.apache.org/dist/hadoop/common/hadoop-3.1.3/hadoop-3.1.3.tar.gz
ARG HIVE_SOURCE=https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz

USER root
RUN apt-get update && apt-get install -y \
							openssh-server \
							wget \
							libarchive-tools \
							zip \
							unzip \
							python3-pip \
							dnsutils
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin/#PermitRootLogin/' /etc/ssh/sshd_config && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

RUN groupadd --gid 1000 hadoop    && useradd --uid 1000 -m -d /hadoop -s /bin/bash -g hadoop    hadoop    && echo 'hadoop:hadoop'      | chpasswd
RUN groupadd --gid 1001 hive     && useradd --uid 1001 -m -d /hive  -s /bin/bash -g hive     hive     && echo 'hive:hive'        | chpasswd

USER hadoop
RUN mkdir -p ~hadoop/.ssh && ssh-keygen -t rsa -P '' -f ~hadoop/.ssh/id_rsa    && cat ~hadoop/.ssh/id_rsa.pub >> ~hadoop/.ssh/authorized_keys       && chmod 0600 ~hadoop/.ssh/authorized_keys
RUN wget ${HADOOP_SOURCE} -O /tmp/hadoop.tar.gz && \
			tar -C /hadoop -xvf /tmp/hadoop.tar.gz --strip-components 1

USER hive
RUN mkdir -p ~hive/.ssh && ssh-keygen -t rsa -P '' -f ~hive/.ssh/id_rsa     && cat ~hive/.ssh/id_rsa.pub >> ~hive/.ssh/authorized_keys         && chmod 0600 ~hive/.ssh/authorized_keys
RUN wget ${HIVE_SOURCE}  -O /tmp/hive.tgz && \
			tar -C /hive -xvf /tmp/hive.tgz --strip-components 1

USER root

RUN rm /tmp/hadoop.tar.gz && rm /tmp/spark.tgz && rm /tmp/livy.zip

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]