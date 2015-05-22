export CLASSPATH=$CLASSPATH:/usr/local/share/java/zmq.jar
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

git clone --depth 1 https://github.com/mmoghadas/subzero.git
cd subzero
javac hwserver.java
jar -cvfm hwserver.jar manifest.txt hwserver.class
java -Djava.library.path=/usr/local/lib -jar hwserver.jar 5112
