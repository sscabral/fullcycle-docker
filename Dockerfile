# Defines the image to be used to build the Go application.
FROM golang:alpine as builder

# Sets the appropriate environment variables for the Go application to be built.
ENV GO111MODULE=on
ENV GOFLAGS=-mod=vendor
ENV APP_HOME /go/src/fullcycle

# Creates the directory structure for the Go application to be built.
RUN mkdir -p "${APP_HOME}"
RUN mkdir -p /app

# Copies the source code into the container and builds the Go application.
WORKDIR "${APP_HOME}"
COPY /src/ "${APP_HOME}"
RUN CGO_ENABLED=0 go build -o /src main.go

# Defines the image state to be used to run the Go application, and attaches the built binary to it.
FROM scratch
COPY --from=builder /src /app
CMD ["/app"]
