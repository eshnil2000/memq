#git clone https://github.com/eshnil2000/memq 
#cd memq 
#docker build -t memq .
#docker run -p8081:80 -d memq
#create queue, then add/drain messages
#curl -X POST 10.0.0.241:8081/queues/work
#  560  curl -X GET 10.0.0.241:8081/queues/work/messages
#  561  curl -X GET 10.0.0.241:8081/queues/work/messages
#  562  curl -X GET 10.0.0.241:8081/queues/work/messages
#  563  curl -X GET 10.0.0.241:8081/queues/work/messages
#  564  curl -X POST 10.0.0.241:8081/queues/work/messages -d "message 1"
#  565  curl -X POST 10.0.0.241:8081/queues/work/messages -d "message 2"
#  566  curl -X POST 10.0.0.241:8081/queues/work/messages -d "message 3"
#  567  curl -X POST 10.0.0.241:8081/queues/work/drain
#  568  curl -X GET 10.0.0.241:8081/stats
#  569  curl -X DELETE 10.0.0.241:8081/queues/work

FROM golang:1.12-alpine
RUN apk add git
RUN go get github.com/gorilla/mux
RUN go get github.com/eshnil2000y/memq/broker
RUN go get github.com/eshnil2000/memq/api
ADD . /memq
WORKDIR /memq
EXPOSE 80
ENTRYPOINT ["go", "run", "/memq/main.go"]
