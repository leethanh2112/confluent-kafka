FROM sheepkiller/kafka-manager:latest
MAINTAINER ThanhCL

# Copy cert & config

COPY kafka.server.keystore.jks /home/kafka.server.keystore.jks
COPY kafka.server.truststore.jks /home/kafka.server.truststore.jks
COPY application.conf /kafka-manager-1.3.1.8/conf/application.conf
COPY consumer.properties /kafka-manager-1.3.1.8/conf/consumer.properties

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager","-Dconfig.file=conf/application.conf"]


