FROM golang:1.24.3-alpine3.21

COPY . /app
WORKDIR /app

RUN go build -o main .

CMD ["/app/main"]
