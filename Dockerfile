FROM josemyd/centos-jdk:jdk-8

USER root

ADD cloudera-cdh5.repo /etc/yum.repos.d/

RUN rpm --import https://archive.cloudera.com/cdh5/redhat/7/x86_64/cdh/RPM-GPG-KEY-cloudera \
    && yum install -y python-setuptools sudo hadoop-libhdfs \
    impala impala-catalog impala-server hive hive-metastore \
    impala-state-store impala-shell \
    && easy_install supervisor \
    && yum clean all

ADD etc/supervisord.conf /etc/
ADD etc/default/impala /etc/default/
ADD etc/hadoop/conf/core-site.xml /etc/hadoop/conf/
ADD etc/hadoop/conf/hdfs-site.xml /etc/hadoop/conf/
ADD etc/hadoop/conf/mapred-site.xml /etc/hadoop/conf/
ADD etc/impala/conf/hive-site.xml /etc/impala/conf/
ADD etc/impala/conf/hive-site.xml /etc/hive/conf/

WORKDIR /

# Various helper scripts
ADD bin/start-impala.sh /
ADD bin/start-hive.sh /
ADD bin/supervisord-bootstrap.sh /
ADD bin/wait-for-it.sh /
RUN chmod +x ./*.sh

# Impala Ports
EXPOSE 21000 21050 22000 23000 24000 25010 26000 28000

##########################
# Kudu Ports
##########################
EXPOSE 8050 7050 8051 7051

ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
