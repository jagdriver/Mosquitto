#
# WaveSnake Mosquitto Docker Build File
# Change to alpine latest
# Change to mosquitto version 

FROM easypi/alpine-arm:latest

LABEL MAINTAINER="Niels J. Nielsen jagdriver@hotmail.com"
LABEL Description="Eclipse Mosquitto MQTT Broker - RPI WaveSnake"

#RUN apk --no-cache add mosquitto=1.4.15-r0 && \
 RUN apk --no-cache add mosquitto=1.6.8 && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log /mosquitto/config/conf.d  && \
    chown -R mosquitto:mosquitto /mosquitto

COPY ${PWD}/config/mosquitto.conf /mosquitto/config
COPY ${PWD}/config/conf.d/acl /mosquitto/config/conf.d
COPY ${PWD}/config/conf.d/pw /mosquitto/config/conf.d

COPY docker-entrypoint.sh /
RUN chmod ugo+rwx  /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
