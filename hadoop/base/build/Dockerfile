FROM ubuntu:18.04

LABEL maintainer="nutthaphon@gmail.com"

ARG CLUSTER_NAME=test
ARG JAVA_HOME=/java
ARG HADOOP_HOME=/hadoop
ARG SPARK_HOME=/spark
ARG HADOOP_SOURCE=https://www-eu.apache.org/dist/hadoop/common/hadoop-3.1.3/hadoop-3.1.3.tar.gz
ARG SPARK_SOURCE=https://www-us.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
ARG LIVY_SOURCE=https://www-eu.apache.org/dist/incubator/livy/0.7.0-incubating/apache-livy-0.7.0-incubating-bin.zip

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
RUN groupadd --gid 1001 spark     && useradd --uid 1001 -m -d /spark  -s /bin/bash -g spark     spark     && echo 'spark:spark'        | chpasswd

RUN mkdir -p /livy && chown -R spark:spark /livy
RUN mkdir -p /spark/conf && chown -R spark:spark /spark/conf

USER hadoop
RUN mkdir -p ~hadoop/.ssh && ssh-keygen -t rsa -P '' -f ~hadoop/.ssh/id_rsa    && cat ~hadoop/.ssh/id_rsa.pub >> ~hadoop/.ssh/authorized_keys       && chmod 0600 ~hadoop/.ssh/authorized_keys
RUN wget ${HADOOP_SOURCE} -O /tmp/hadoop.tar.gz && \
			tar -C /hadoop -xvf /tmp/hadoop.tar.gz --strip-components 1

USER spark
RUN mkdir -p ~spark/.ssh && ssh-keygen -t rsa -P '' -f ~spark/.ssh/id_rsa     && cat ~spark/.ssh/id_rsa.pub >> ~spark/.ssh/authorized_keys         && chmod 0600 ~spark/.ssh/authorized_keys
RUN wget ${SPARK_SOURCE}  -O /tmp/spark.tgz && \
			tar -C /spark -xvf /tmp/spark.tgz --strip-components 1
RUN wget ${LIVY_SOURCE} -O /tmp/livy.zip && \
			bsdtar -C /livy --strip-components=1 -xvf /tmp/livy.zip
RUN pip3 install \
		lxml \
		pandas \
		beautifulsoup4 \
		html5lib \
		numpy \
		matplotlib \
		scikit-learn \
		scipy

USER root
RUN ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip
RUN rm /tmp/hadoop.tar.gz && rm /tmp/spark.tgz && rm /tmp/livy.zip

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]