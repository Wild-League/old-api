FROM --platform=$BUILDPLATFORM openresty/openresty:alpine AS build

ARG TARGETPLATFORM
ARG BUILDPLATFORM

USER root

EXPOSE 9090

WORKDIR /api

COPY . .

RUN apk add --no-cache git libc-dev readline readline-dev gcc make wget unzip
RUN apk add --no-cache openssl openssl-dev lua5.1 lua5.1-dev luarocks
RUN luarocks-5.1 install luaossl
# RUN luarocks-5.1 install wildleague-0.0.1-1.rockspec
RUN luarocks-5.1 install pgmoon
RUN luarocks-5.1 install bcrypt
RUN luarocks-5.1 install lua-resty-openssl
RUN luarocks-5.1 install luabitop
RUN luarocks-5.1 install lua-resty-jwt
RUN luarocks-5.1 install lapis