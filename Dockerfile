# This Dockerfile has two required ARGs to determine which base image
# to use for the JDK and which sbt version to install.
#
# https://github.com/mozilla/docker-sbt
# https://hub.docker.com/r/adoptopenjdk/openjdk11
# docker build --build-arg OPENJDK_TAG=8u232 --build-arg SBT_VERSION=1.3.8 .
#

FROM adoptopenjdk/openjdk11

ARG SBT_VERSION=1.3.8

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion