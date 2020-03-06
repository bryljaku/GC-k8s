#!bash

docker build -t serniczek/fib-client:latest -t serniczek/fib-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t serniczek/fib-worker:latest -t serniczek/fib-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker build -t serniczek/fib-server:latest -t serniczek/fib-server:$GIT_SHA -f ./server/Dockerfile ./server

docker push serniczek/fib-client:$GIT_SHA
docker push serniczek/fib-worker:$GIT_SHA
docker push serniczek/fib-server:$GIT_SHA

docker push serniczek/fib-client:latest
docker push serniczek/fib-worker:latest
docker push serniczek/fib-server:latest

kubectl apply -f k8s

kubectl set image deployments/api-deployment api=serniczek/fib-server:$GIT_SHA
kubectl set image deployments/client-deployment client=serniczek/fib-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=serniczek/fib-worker:$GIT_SHA