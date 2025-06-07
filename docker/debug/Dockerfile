FROM golang:1.23.0 AS build
WORKDIR /
COPY . .
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN CGO_ENABLED=0 go build -gcflags "all=-N -l" -o ./app

FROM golang:1.23.0
WORKDIR /
COPY --from=build /go/bin/dlv /usr/local/bin/dlv
COPY --from=build /app /app
ENTRYPOINT ["/usr/local/bin/dlv", "--listen=:40000", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/app"]
