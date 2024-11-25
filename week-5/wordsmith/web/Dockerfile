FROM golang:1.23.3-alpine3.20 as build

WORKDIR /build
COPY dispatcher.go /build/dispatcher.go
RUN go build dispatcher.go

FROM scratch

WORKDIR /app
COPY --from=build /build/dispatcher /app/dispatcher
COPY static /app/static

ENTRYPOINT ["/app/dispatcher"]
