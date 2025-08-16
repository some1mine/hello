# 원격 저장소에서 소스를 복사해 온다.
git clone https://github.com/some1mine/hello

# 복사해 온 프로젝트로 들어간다.
cd hello

# 소스 파일을 docker이미지로 빌드한다.
docker build -t thedeny1106/hello:latest .

# docker hub에 로그인 한다.
docker login -u thedeny1106 -p $DOCKER_PASSWORD

# 생성된 이미지를 docker hub에 push
docker push thedeny1106/hello:latest

# 서비스 실행
docker service create \
        --name hello-app \
        --publish published=8000,target=8000 \
        --replicas 3 \
        thedeny1106/hello

# pull 받아온 이미지 제거
docker rmi thedeny1106/hello:latest

# 디렉터리 삭제
cd ..
rm -rf hello

