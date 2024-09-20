FROM golang:1.22.6-alpine AS builder

WORKDIR /fullcycle
COPY main.go .
RUN go mod init desafio1_fullcycle
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /fullcycle/main .
CMD ["./main"]