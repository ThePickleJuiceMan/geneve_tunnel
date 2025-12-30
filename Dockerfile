FROM debian

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install iproute2 -y \ 
    && apt-get install -y iputils-ping

COPY /src/tunnelendpoint.sh /app/tunnelendpoint.sh
RUN chmod 755 /app/tunnelendpoint.sh

CMD ["/bin/sh", "/app/tunnelendpoint.sh", "&"]