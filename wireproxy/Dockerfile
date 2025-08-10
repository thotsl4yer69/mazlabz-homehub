FROM golang:1.22-alpine AS build
RUN apk add --no-cache git
WORKDIR /src
RUN git clone https://github.com/octeep/wireproxy . \
 && go build -o /out/wireproxy ./cmd/wireproxy

FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl iptables ip6
cd M:\homehub

# 1) Create wireproxy Dockerfile (build from source, no registry auth needed)
@'
FROM golang:1.22-alpine AS build
RUN apk add --no-cache git
WORKDIR /src
RUN git clone https://github.com/octeep/wireproxy . \
 && go build -o /out/wireproxy ./cmd/wireproxy

FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl iptables ip6tables
COPY --from=build /out/wireproxy /usr/local/bin/wireproxy
ENTRYPOINT ["wireproxy"]
CMD ["-c","/etc/wireproxy/wg0.conf","-p","0.0.0.0:8888","-socks5","0.0.0.0:1080"]
