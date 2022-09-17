FROM alpine:3.9

WORKDIR /opt
COPY ./bin/server.arm server
RUN chmod +x server
CMD [ "/opt/server" ]