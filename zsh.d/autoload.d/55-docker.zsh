function docker-clean-house {
    set -x
    docker rm -f $(docker ps -aq)
    docker rmi -f $(docker images -aq)
    docker ps -a
    docker images -a
    set +x
}
