#기존 서비스를 제거한다
docker service rm hello

#docker hub에 로그인을 한다 
docker login -u thedeny1106 -p $DOCKER_PASSWORD

#생성된 이미지를 docker hub에서 pull 한다 
docker pull thedeny1106/hello:latest

#서비스 실행 
docker service create \
      --name hello-app \
      --publish published=8000,target=8000 \
      --replicas 3 \
      thedeny1106/hello:latest
