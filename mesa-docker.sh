docker run -d \
    --name mesa-server \
    -p 27015-27030:27015-27030/udp \
    -p 27015-27030:27015-27030/tcp \
    -e SERVER_NAME="Black Mesa: Deathmatch" \
    aabusheikh/black-mesa-docker
