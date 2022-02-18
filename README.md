# black-mesa-docker
Docker image for a black mesa dedicated server.

___

## First run
Use the mesa-docker.sh script for the first launch of the container.

1. (Optional) modify the server's hostname in mesa-docker.sh.

    Modify the value of SERVER_NAME

2. Run mesa-docker.sh. This will also pull the latest docker image from dockerhub.

    The container will run in detached mode

___

## Attach/detach
To attach to the container and server console, run the following command.

    docker container attach mesa-server

The server console will not display a prompt so it may look like nothing happened. To test it out type out a command such as:

    sm plugins list

To detach without stopping the container, use the  ```CTRL+P,CTRL+Q```  key combination.

To access the container filesystem and make changes to or browse cfg files, you can run a bash instance when detached. IT will land in the server directory by default.

    docker container exec -it mesa-server bash

___

## Stop/restart/reset
You can either stop the container when detached or kill the server when attached.

To stop the container:

    docker container stop mesa-server

To restart:

    docker container start mesa-server

To completely reset the container, first stop then remove the current container. Then re-run mesa-docker.sh.

To remove:

    # when stopped
    docker container rm mesa-server
