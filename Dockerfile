FROM ubuntu:22.04 as git

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git


FROM node:18-bookworm

ARG UID=1000
ARG GID=1000

WORKDIR /prisma-mock

RUN apt-get update && \
  apt-get install -y --no-install-recommends sudo && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  echo "node   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
  corepack enable

COPY --from=git /usr/bin/git /usr/bin

USER node
