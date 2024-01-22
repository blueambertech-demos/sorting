FROM golang:1.21-alpine

WORKDIR /sortingdemo
ENV CGO_ENABLED=0
ENV GOTRACEBACK=single

COPY go.mod ./
RUN go mod download

COPY . ./
RUN go build -mod=readonly -v -o ./app

ENTRYPOINT ["./app"]