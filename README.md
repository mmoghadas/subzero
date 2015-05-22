SubZero
==================================
This tool lets you run two docker images that communicate via ZeroMQ.  Don't expect much....From the client pass any word and the server responds with upppercase.
* Server in java
* Client in ruby

## Usage Options
- Manual
- Docker

## Usage: Docker
Assuming you are configured to use docker...

I have pre-baked an docker image that includes all necessary packages, libraries and gems. You will still need to build the images for server and the client.  Here's how:
```
# build server image
docker build -t subzero/server server/.

# build server image
docker build -t subzero/client client/.

Terminal #1
./run_server.sh

Terminal #2
./run_client.sh "uppercase me"
```

## Usage: Manual
Assuming you have your java and ruby environments configured properly for ZeroMQ:
```
# Server
javac hwserver.java
java hwserver 5112

# Client
ruby client.rb SERVER_HOSTNAME:5112 your_message_here
```