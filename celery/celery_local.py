from .celery import *
import environ

print("Setup celery_local.py init")

env = environ.Env()

timezone = env('TIMEZONE', default='Pacific/Auckland')

RABBITMQ_DEFAULT_USER = env('RABBITMQ_DEFAULT_USER', default='taiga')
RABBITMQ_DEFAULT_PASS = env('RABBITMQ_DEFAULT_PASS', default='taiga')
RABBITMQ_DEFAULT_VHOST = env('RABBITMQ_DEFAULT_VHOST', default='taiga')

broker_url = 'amqp://{}:{}@rabbitmq:5672/{}'.format(
    RABBITMQ_DEFAULT_USER, RABBITMQ_DEFAULT_PASS, RABBITMQ_DEFAULT_VHOST)
result_backend = 'redis://redis:6379/0'


print("Setup celery_local.py finished")
