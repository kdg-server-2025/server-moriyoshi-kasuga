FROM golang:1.24.3-bookworm

COPY . /app
WORKDIR /app

RUN go build -o main .

CMD ["/app/main"]
