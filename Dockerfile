FROM golang:latest AS builder

WORKDIR /app
COPY main.go /app/
RUN go build -o /app/pipeline /app/main.go

FROM alpine:latest
LABEL version="1.0"
LABEL maintainer="AnyKey<Any@k.ey>"
WORKDIR /
COPY --from=builder /app/pipeline .
CMD [ "/pipeline" ]