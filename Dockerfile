FROM golang:1.18.3-alpine AS builder

WORKDIR /usr/src/coderocks

ENV GO111MODULE=auto

COPY . .

RUN go build

FROM scratch

WORKDIR /

COPY --from=builder /usr/src/coderocks .

CMD ["./coderocks"]