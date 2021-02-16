# 원하는 문자열이 포함된 이미지 싹다 지우기
```
docker rmi `docker images | awk '$1 ~ /문자열/ {print $3}'`
```

# 이미지 목록 조회
```
docker images 
```
# 태깅 tag <이미지명:tag> <hub계정명>/<hub레포지토리>
```
docker tag something-dock:0.1 segulee/repository-name
```
# 푸시 push <이미지명:tag> <hub계정명>/<hub레포지토리>
```
docker push something-dock:0.1 segulee/repository-name
```
# 시작 run <옵션> --name <이미지 이름 지정> <실행할 이미지> <내부 실행 명령어>
-d daemon
--name 이름지정
-i, -t bash shell 입력 출력

```
docker run -d -p 80:80 -p 443:443 -it --name something something-dock:0.1
```
# 그 외
```
docker ps -a
docker exec -it something-dock
docker pull something-dock:0:2
docker build -f /path/to/docker/file
```
</br>
