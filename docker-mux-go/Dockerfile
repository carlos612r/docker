FROM alpine:3.8

RUN apk add --no-cache \
    ca-certificates \
    git \
    gcc \
    musl-dev \
    openssl \
    go

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV APIPATH $GOPATH/src/api
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" "$APIPATH" && chmod -R 777 "$GOPATH"

WORKDIR $APIPATH
COPY . .

RUN \
    go get -d -v \
    && go install -v \
    && go build

EXPOSE 3000
CMD ["./api"]
