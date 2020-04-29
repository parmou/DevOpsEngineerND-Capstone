FROM golang:1.8-alpine  as build
COPY . /go/src/hello-app
RUN go install hello-app

FROM alpine:3.7
COPY --from=build /go/bin/hello-app .
ENV PORT 8080
CMD ["./hello-app"]

