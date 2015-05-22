docker ps -a|grep zeromqclient | awk '{print $1}' | xargs docker rm
docker run -i -t --name zeromqclient --link zeromqserver:zeromqserver subzero/client /usr/local/rvm/bin/rvm ruby-2.2.1 do ruby client.rb zeromqserver:5112 $1
