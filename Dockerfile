FROM alpine:3.20 as builder

RUN apk add --update build-base mbedtls-dev libev-dev git

WORKDIR /src

ADD . /src

RUN make -j $(nproc)

FROM alpine:3.20

RUN apk add --update mbedtls libev

COPY --from=builder /src/goldy /usr/local/bin/

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
