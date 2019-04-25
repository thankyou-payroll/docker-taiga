#!/bin/sh
set -e
if [ ! -f /taiga_events/config.json ]; then
    echo "Generating /taiga_events/config.json file..."
    RABBITMQ_HOST=${RABBITMQ_HOST:-"rabbitmq"}
    RABBITMQ_DEFAULT_USER=${RABBITMQ_DEFAULT_USER:-"taiga"}
    RABBITMQ_DEFAULT_PASS=${RABBITMQ_DEFAULT_PASS:-"taiga"}
    RABBITMQ_DEFAULT_VHOST=${RABBITMQ_DEFAULT_VHOST:-"taiga"}
    cat > /taiga_events/config.json <<EOF
{
    "url": "amqp://$RABBITMQ_DEFAULT_USER:$RABBITMQ_DEFAULT_PASS@$RABBITMQ_HOST:5672/$RABBITMQ_DEFAULT_VHOST",
    "secret": "$SECRET_KEY",
    "webSocketServer": { "port": 8888 }
}

EOF
fi

exec "$@"
