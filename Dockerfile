FROM nanoscale/gateway:deploy-5.4.0

ADD gateway /gateway/gateway
RUN chmod +x /gateway/gateway
