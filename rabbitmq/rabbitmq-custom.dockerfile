FROM rabbitmq:3.7-management

RUN apt-get update && \
apt-get install -y curl unzip

RUN curl -X GET https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.0/rabbitmq_message_deduplication-0.5.0.ez -L -o /opt/rabbitmq/plugins/rabbitmq_message_deduplication-0.5.0.ez
RUN curl -X GET https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.0/elixir-1.10.4.ez -L -o /opt/rabbitmq/plugins/elixir-1.10.4.ez
RUN curl -X GET https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez -L -o /opt/rabbitmq/plugins/rabbitmq_delayed_message_exchange-3.8.0.ez 

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange rabbitmq_message_deduplication