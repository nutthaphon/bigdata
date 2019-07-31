docker commit hdmaster nutthaphon/hadoop-master:3.1.2-spark2.4.3-jdk8
docker commit hdslave1 nutthaphon/hadoop-slave1:3.1.2-spark2.4.3-jdk8
docker commit hdslave2 nutthaphon/hadoop-slave2:3.1.2-spark2.4.3-jdk8
docker commit hiveserver2 nutthaphon/hive2:3.1.1-jdk8
docker commit nifiserver nutthaphon/nifi:1.9.2-jdk8
docker commit zeppelin nutthaphon/zeppelin:0.8.1-sshd
docker commit mongodb nutthaphon/mongo:4.0.10
docker commit columnstore nutthaphon/mariadb-columnstore:1.2.3
docker commit mysql nutthaphon/mariadb:10.4.6
docker commit hueserver nutthaphon/hue:4.4.0
docker commit oozie nutthaphon/oozie:5.1.0


docker push nutthaphon/hadoop-master:3.1.2-spark2.4.3-jdk8
docker push nutthaphon/hadoop-slave1:3.1.2-spark2.4.3-jdk8
docker push nutthaphon/hadoop-slave2:3.1.2-spark2.4.3-jdk8
docker push nutthaphon/hive2:3.1.1-jdk8
docker push nutthaphon/nifi:1.9.2-jdk8
docker push nutthaphon/zeppelin:0.8.1-sshd
docker push nutthaphon/mongo:4.0.10
docker push nutthaphon/mariadb-columnstore:1.2.3
docker push nutthaphon/mariadb:10.4.6
docker push nutthaphon/hue:4.4.0
docker push nutthaphon/oozie:5.1.0


