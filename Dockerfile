FROM golang:latest AS builder

WORKDIR /pipeline
ENV CGO_ENABLED=0
COPY main.go /pipeline/
RUN go build -o /pipeline/pipeline /pipeline/main.go

FROM scratch
LABEL version="1.0"
LABEL maintainer="AnyKey<Any@k.ey>"
WORKDIR /
COPY --from=builder /pipeline/pipeline /pipeline
CMD [ "/pipeline" ]