FROM golang:1.23.3-alpine3.20

WORKDIR /app
COPY dispatcher.go /app/dispatcher.go
RUN go build dispatcher.go

ENTRYPOINT ["/app/dispatcher"]
EXPOSE 80
