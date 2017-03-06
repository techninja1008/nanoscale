FROM nanoscale/gateway:deploy-5.4.0

ADD gateway /gateway/gateway
RUN chmod +x /gateway/gateway

ENTRYPOINT ./gateway -server=$SERVER -db-migrate=$DB_MIGRATE -store-migrate=$STORE_MIGRATE \
  -proxy-host=$PROXY_HOST  -proxy-domain=$PROXY_DOMAIN -proxy-enable-os-env=$PROXY_ENABLE_OS_ENV \
  -admin-host=$ADMIN_HOST -admin-enable-registration=$ADMIN_ENABLE_REGISTRATION -admin-session-auth-key=$ADMIN_SESSION_AUTH_KEY \
  -remote-endpoint-script-enabled=$SCRIPT_ENABLED -remote-endpoint-store-enabled=$STORE_ENABLED \
  -proxy-code-timeout=$PROXY_CODE_TIMEOUT -proxy-http-timeout=$PROXY_HTTP_TIMEOUT -proxy-health-check-path="$HEALTH_CHECK_PATH" \
  -db-driver=$DB_DRIVER  -db-conn-string="$DB_CONN" -db-max-connections=$DB_MAX_CONN -store-type=$STORE_TYPE -store-conn-string="$STORE_CONN" -store-max-connections=$STORE_MAX_CONN \
  -remote-endpoint-docker-enabled=$DOCKER_ENABLED -docker-memory=$DOCKER_MEMORY -docker-cpu-shares=$DOCKER_CPU_SHARES -docker-host="$DOCKER_HOST" -docker-tls="$DOCKER_TLS" -docker-tls-cert-content="$DOCKER_TLS_CERT_CONTENT" -docker-tls-cacert-content="$DOCKER_TLS_CACERT_CONTENT" -docker-tls-key-content="$DOCKER_TLS_KEY_CONTENT"  \
  -remote-endpoint-smtp-enabled=$SMTP_ENABLED -remote-endpoint-soap-enabled=$SOAP_ENABLED -stats-collect=$STATS_COLLECT -stats-migrate=$STATS_MIGRATE -stats-driver="$STATS_DRIVER" -stats-conn-string="$STATS_CONN_STRING" -stats-max-connections=$STATS_MAX_CONNECTIONS
