docker ps -a|grep zeromqserver | awk '{print $1}' | xargs docker rm
docker run -i -t --name zeromqserver subzero/server
