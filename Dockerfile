FROM rabbitmq:3.8-management
MAINTAINER MagedIn Technology <support@magedin.com>

ENV PLUGINS_DIR=/plugins
ENV ELIXIR_PLUGIN=https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.0/elixir-1.10.4.ez
ENV MESSAGE_DEDUPLICATION_PLUGIN=https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.0/rabbitmq_message_deduplication-0.5.0.ez


# BASE INSTALLATION ----------------------------------------------------------------------------------------------------

RUN apt-get update && apt-get install -y \
  curl \
  vim


# PLUGINS INSTALLATION -------------------------------------------------------------------------------------------------

#https://github.com/noxdafox/rabbitmq-message-deduplication
RUN ( \
  cd ${PLUGINS_DIR} \
  && curl -OL ${ELIXIR_PLUGIN} \
  && curl -OL ${MESSAGE_DEDUPLICATION_PLUGIN} \
  && chown rabbitmq: * \
)

# BASE CONFIGURATION ---------------------------------------------------------------------------------------------------

RUN rabbitmq-plugins enable rabbitmq_message_deduplication
