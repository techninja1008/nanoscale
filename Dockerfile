FROM nanoscale/gateway:deploy

ADD gateway /gateway/gateway
RUN chmod +x /gateway/gateway
