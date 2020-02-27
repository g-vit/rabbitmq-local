docker run \
    -e RABBITMQ_ERLANG_COOKIE=ajsflkajsdfkljskldfjklsdjfhjhjhjhjhjhsdjfhjd \
    -e RABBITMQ_USE_LONGNAME=true \
    -e RABBITMQ_NODENAME=rabbit@localhost \
    -e RABBITMQ_CONFIG_FILE=/local/rabbitmq.conf \
    -e RABBITMQ_MNESIA_DIR=/data \
    -v $(pwd)/volume:/data \
    -v $(pwd)/local:/local \
    -p 5672:5672 \
    -p 7102:15672 \
    -it rabbitmq:3.8-management \
    sh -c "sed -i '/^ *$/d' /local/rabbitmq.conf && rabbitmq-plugins enable rabbitmq_management rabbitmq_management_agent rabbitmq_shovel rabbitmq_shovel_management && rabbitmq-server"
