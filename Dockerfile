FROM alpine:3.9
WORKDIR /opt
COPY ./bin/server server
RUN chmod +x server
CMD [ "./server" ]
