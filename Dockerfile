FROM golang:1.17.7-alpine3.15 as base

ENV GOOS linux
ENV CGO_ENABLED 0
ENV GO111MODULE on

WORKDIR /src
COPY go.* .
RUN go mod download && go mod verify
COPY . .
RUN go test ./...
RUN go build -o app

FROM scratch
WORKDIR /src
COPY --from=base /src/app /usr/local/bin/app
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/app"]
