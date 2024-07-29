FROM alpine:3.16 as builder

RUN apk add --update build-base curl git

WORKDIR /src

ADD . /src

RUN make deps -j $(nproc) && make -j $(nproc)

FROM alpine:3.16

COPY --from=builder /src/goldy /usr/local/bin/

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
