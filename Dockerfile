FROM --platform=$BUILDPLATFORM alpine:latest AS build

ARG TARGETPLATFORM
ARG BUILDPLATFORM

USER root

EXPOSE 9090

WORKDIR /api

COPY . .

RUN apk add --no-cache git libc-dev readline readline-dev gcc make wget unzip
RUN apk add --no-cache libressl-dev lua-dev luarocks
# RUN luarocks-5.1 install luaossl
# RUN luarocks-5.1 install wildleague-0.0.1-1.rockspec
