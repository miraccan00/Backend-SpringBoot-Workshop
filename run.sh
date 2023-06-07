servicename="springk8s"
tag="1.0.0"
docker build -t $servicename .
docker image tag $servicename:$tag miraccan/$servicename:$tag
docker push miraccan/$servicename:$tag