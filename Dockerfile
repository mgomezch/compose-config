FROM alpine:latest

RUN apk update \
 && apk add jq \
 && rm -rf /var/cache/apk/* \
 && mkdir /input /output

WORKDIR /output

CMD jq --from-file="/input/in.jq" > /output/output.json
