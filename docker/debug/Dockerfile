FROM golang:1.16 AS build
WORKDIR /
COPY . .
RUN CGO_ENABLED=0 go get -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv
RUN CGO_ENABLED=0 go build -gcflags "all=-N -l" -o ./app

FROM alpine
COPY --from=build /go/bin/dlv /root/dlv
COPY --from=build /app /root/app
ENTRYPOINT [ "/root/dlv" , "--listen=:40000", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/root/app"]]