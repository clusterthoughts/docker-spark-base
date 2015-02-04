FROM java:8-jdk

RUN wget -q http://d3kbcqa49mib13.cloudfront.net/spark-1.2.0-bin-hadoop2.4.tgz -O /opt/spark-1.2.0-bin-hadoop2.4.tgz
RUN tar zxf /opt/spark-1.2.0-bin-hadoop2.4.tgz -C /opt/

RUN groupadd -r spark -g 999 && useradd -u 999 -r -g spark -d /opt/spark-1.2.0-bin-hadoop2.4 -s /sbin/nologin -c "Docker image user" spark && chown -R spark:spark /opt/spark-1.2.0-bin-hadoop2.4

RUN mkdir /work && chown -R spark:spark /work
ENV SPARK_WORKER_DIR /work

USER spark