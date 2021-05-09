FROM golang:1.14 AS builder

WORKDIR /goProject

RUN go get github.com/go-delve/delve/cmd/dlv
RUN go get -u github.com/cosmtrek/air

COPY . .

#RUN go build -gcflags="all=-N -l" -o main .

FROM builder as test
EXPOSE 3000 40000


COPY --from=builder . /
COPY --from=builder /go/bin/dlv /

CMD ["air"]
#CMD ["/dlv", "--headless", "--listen=:40000", "--api-version=2", "exec", "./tmp/goProject"]
