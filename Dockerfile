FROM golang:alpine3.14 AS builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go


## Deploy
FROM scratch

WORKDIR /

COPY --from=builder /main /main

EXPOSE 8080

ENTRYPOINT ["/main"]