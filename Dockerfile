FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y \
    microsocks \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY entrypoint.sh /src/

EXPOSE 1080
ENTRYPOINT ["/src/entrypoint.sh"]
