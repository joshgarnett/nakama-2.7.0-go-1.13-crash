FROM golang:1.13.0-alpine3.10 as builder

ENV GOOS linux
ENV GOARCH amd64
ENV CGO_ENABLED 1

RUN apk --no-cache add ca-certificates gcc musl-dev git

WORKDIR /builder

COPY src src
COPY go.mod go.mod

RUN go build --buildmode=plugin -trimpath -o ./src/modules/main.so ./src/main.go

FROM heroiclabs/nakama:2.7.0

COPY --from=builder /builder/src/modules/main.so /nakama/data/modules
