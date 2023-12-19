FROM golang:alpine as builder

ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor

ENV APP_HOME /go/src/fullcycle
RUN mkdir -p "${APP_HOME}"
RUN mkdir -p /app

WORKDIR "${APP_HOME}"
COPY /src/ "${APP_HOME}"
RUN CGO_ENABLED=0 go build -o /src main.go

FROM scratch
COPY --from=builder /src /app
CMD ["/app"]
