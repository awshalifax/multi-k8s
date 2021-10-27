docker build -t awshalifax/client:latest -t awshalifax/client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t awshalifax/server:latest -t awshalifax/server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t awshalifax/worker:latest -t awshalifax/worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push awshalifax/client:latest
docker push awshalifax/client:$GIT_SHA

docker push awshalifax/server:latest
docker push awshalifax/server:$GIT_SHA

docker push awshalifax/worker:latest
docker push awshalifax/worker:$GIT_SHA

kubectl apply -f k8s/
kubectl set image deployments/client-deployment client=awshalifax/client:$GIT_SHA
kubectl set image deployments/server-deployment server=awshalifax/server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=awshalifax/worker:$GIT_SHA
