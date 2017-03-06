FROM nanoscale/gateway:deploy-5.4.0

ADD gateway /gateway/gateway
RUN chmod +x /gateway/gateway

ENTRYPOINT ./gateway -server=$SERVER -db-migrate=$DB_MIGRATE -store-migrate=$STORE_MIGRATE -proxy-cache-apis=$CACHE_APIS \
  -proxy-host=$PROXY_HOST  -proxy-domain=$PROXY_DOMAIN -proxy-enable-os-env=$PROXY_ENABLE_OS_ENV \
  -admin-host=$ADMIN_HOST -admin-enable-registration=$ADMIN_ENABLE_REGISTRATION -admin-session-auth-key=$ADMIN_SESSION_AUTH_KEY -admin-path-prefix=$ADMIN_PATH -admin-session-cookie-domain=$ADMIN_SESSION_COOKIE_DOMAIN -admin-show-version=$ADMIN_SHOW_VERSION \
  -enable-broker=$ENABLE_LOGGING_BROKER -broker=$LOGGING_BROKER_HOST -broker-pub-port=$LOGGING_BROKER_PUB_PORT -broker-sub-port=$LOGGING_BROKER_SUB_PORT -broker-ws=$LOGGING_BROKER_WS \
  -bleve-logging-file=$BLEVE_LOGGING_FILE -bleve-logging-delete-after=$BLEVE_LOGGING_DELETE_AFTER -elastic-logging-url="$ELASTIC_LOGGING_URL" -elastic-logging-delete-after=$ELASTIC_LOGGING_DELETE_AFTER -jobs=$JOBS \
  -remote-endpoint-script-enabled=$SCRIPT_ENABLED -remote-endpoint-store-enabled=$STORE_ENABLED \
  -airbrake-api-key="$AIRBRAKE_API_KEY" -airbrake-environment="$AIRBRAKE_ENVIRONMENT" -airbrake-project-id="$AIRBRAKE_PROJECT_ID" \
  -smtp-user="$SMTP_USER" -smtp-password="$SMTP_PASSWORD" -smtp-sender="$SMTP_SENDER" -smtp-server="$SMTP_SERVER" -smtp-port=$SMTP_PORT -smtp-email-scheme=$EMAIL_SCHEME -smtp-email-host="$EMAIL_HOST" -smtp-email-port=$EMAIL_PORT \
  -proxy-code-timeout=$PROXY_CODE_TIMEOUT -proxy-http-timeout=$PROXY_HTTP_TIMEOUT -proxy-health-check-path="$HEALTH_CHECK_PATH" \
  -admin-default-api-access-scheme="$DEFAULT_API_ACCESS_SCHEME" \
  -admin-google-analytics-tracking-id="$GOOGLE_ANALYTICS_TRACKING_ID" \
  -db-driver=$DB_DRIVER  -db-conn-string="$DB_CONN" -db-max-connections=$DB_MAX_CONN -store-type=$STORE_TYPE -store-conn-string="$STORE_CONN" -store-max-connections=$STORE_MAX_CONN \
  -remote-endpoint-docker-enabled=$DOCKER_ENABLED -docker-memory=$DOCKER_MEMORY -docker-cpu-shares=$DOCKER_CPU_SHARES -docker-host="$DOCKER_HOST" -docker-tls="$DOCKER_TLS" -docker-tls-cert-content="$DOCKER_TLS_CERT_CONTENT" -docker-tls-cacert-content="$DOCKER_TLS_CACERT_CONTENT" -docker-tls-key-content="$DOCKER_TLS_KEY_CONTENT"  \
  -remote-endpoint-smtp-enabled=$SMTP_ENABLED -remote-endpoint-soap-enabled=$SOAP_ENABLED \
  -admin-api-host=$ADMIN_API_HOST -admin-cors-enabled=$ADMIN_CORS_ENABLED -admin-cors-origin="$ADMIN_CORS_ORIGIN" -admin-username="$ADMIN_BASIC_AUTH_USER" -admin-password="$ADMIN_BASIC_AUTH_PASSWORD" \
  -stripe-secret-key="$STRIPE_SECRET_KEY" -stripe-publishable-key="$STRIPE_PUBLISHABLE_KEY" -stripe-fallback-plan="$STRIPE_FALLBACK_PLAN" -stripe-migrate-accounts=$STRIPE_MIGRATE_ACCOUNTS \
  -enable-push-broker=$ENABLE_PUSH_BROKER -push-broker=$PUSH_BROKER_HOST -push-broker-pub-port=$PUSH_BROKER_PUB_PORT -push-broker-sub-port=$PUSH_BROKER_SUB_PORT -push-broker-transport=$PUSH_BROKER_TRANSPORT -push-connect-timeout=$PUSH_CONNECTION_TIMEOUT -push-mqtt-uri=$PUSH_MQTT_URI \
  -job-enable=$JOBS_EXECUTE -job-enable-os-env=$JOBS_ENABLE_OS_ENV -job-code-timeout=$JOBS_CODE_TIMEOUT -job-code-error-lines=$JOBS_NUM_ERR_LINES -remote-endpoint-job-enabled=$JOBS_ENABLED -remote-endpoint-scrub-data=$REMOTE_ENDPOINT_SCRUB_DATA \
  -ws-heartbeat-interval=$WS_HEARTBEAT_INTERVAL -ws-write-deadline=$WS_WRITE_DEADLINE -admin-ui-path-prefix=$ADMIN_UI_PATH_PREFIX -stats-collect=$STATS_COLLECT -stats-migrate=$STATS_MIGRATE -stats-driver="$STATS_DRIVER" -stats-conn-string="$STATS_CONN_STRING" -stats-max-connections=$STATS_MAX_CONNECTIONS \
  -remote-endpoint-key-enabled=$KEYS_ENABLED
