FROM alpine:3.7
MAINTAINER Yves

RUN apk upgrade --update && apk add --no-cache curl bash netcat-openbsd \
&& curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
&& mv kubectl /usr/local/bin \
&& chmod +x /usr/local/bin/kubectl \
&& rm -rf /var/cache/apk/*