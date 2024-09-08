FROM golang:1.23

WORKDIR /app

#COPY . .
RUN go mod tidy

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app . main.go parcel.go

COPY tracker.db ./

#EXPOSE 8080

CMD ["/my_app"]
