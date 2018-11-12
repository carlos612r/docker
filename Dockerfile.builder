FROM golang:1.10-alpine3.8 AS builder

RUN apk add --no-cache --update git

WORKDIR /go/src/api
COPY . .

RUN go get -d -v \
  && go install -v \
  && go build


##


FROM alpine:3.8
COPY --from=builder /go/src/api/api /go/src/api/
EXPOSE 3000
CMD ["/go/src/api/api"]