FROM debian:10.11-slim

ENV LANG C.UTF-8

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y curl && \
  curl -s https://install.speedtest.net/app/cli/install.deb.sh | bash && \
  apt-get install -y speedtest && \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
	
ENTRYPOINT ["speedtest", "--accept-license", "--accept-gdpr"]
