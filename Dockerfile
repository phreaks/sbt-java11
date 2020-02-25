FROM adoptopenjdk/openjdk11:x86_64-alpine-jdk-11.0.6_10-slim

ARG SBT_VERSION=1.3.8

ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN apk update && apk upgrade && \
    apk add --no-cache bash curl tar gzip

RUN curl -sL "https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz" | gunzip | tar -x -C /usr/local && echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

RUN ln -s /usr/local/sbt-launcher-packaging-$SBT_VERSION/bin/sbt /usr/local/bin/sbt

RUN sbt sbtVersion