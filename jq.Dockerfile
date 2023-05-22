FROM alpine:latest

RUN apk update \
 && apk add jq \
 && rm -rf /var/cache/apk/* \
 && mkdir /input /output

CMD \
  output="$( \
    echo null \
    | jq --from-file /input/input.jq \
  )"; \
  if [ $? -eq 0 ]; \
  then \
    printf '%s' "${output}" | tee /output/output.json; \
  fi
