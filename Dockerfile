FROM mileschou/lapis:alpine

EXPOSE 9090

# RUN mkdir /api
WORKDIR /api

COPY . .

RUN apk add --no-cache git libc-dev readline readline-dev gcc make wget unzip
RUN luarocks install wildleague-0.0.1-1.rockspec
