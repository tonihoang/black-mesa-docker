docker container run -itd \
    --name mesa-server \
    -p 27015-27030:27015-27030/udp \
    -p 27015-27030:27015-27030/tcp \
    -e SERVER_NAME="Black Mesa: LAN" \
    aabusheikh/black-mesa-docker
