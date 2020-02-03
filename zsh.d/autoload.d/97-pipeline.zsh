#!/bin/zsh


function pipeline() {
    tmux attach -t pipeline
}

function stop-pipeline() {
    tmux kill-session -t pipeline
    #cd "${WORKSPACE}/elsa" && docker-compose stop
}

function start-pipeline-docker() {
    tmux new-window -d -t pipeline -n "Docker"            -c "${WORKSPACE}/elsa" "docker-compose up"
}
function start-pipeline-beholder() {
    docker ps | grep 'quay.io/decisiv/beholder' | cut -d ' ' -f 1 | xargs docker kill;
    tmux new-window  -dt pipeline -n "Beholder"          -c "${WORKSPACE}/beholder" "while [ 1 ]; do bundler exec rails s; done"
}

function start-pipeline-celery-scheduler() {
    tmux new-window  -dt pipeline -n "Celery::Scheduler" -c "${WORKSPACE}/elsa" "while [ 1 ]; do celery beat -A scheduler --broker=redis://localhost:6379; done"
}
function start-pipeline-celery-worker() {
    tmux new-window  -dt pipeline -n "Celery::Worker"    -c "${WORKSPACE}/elsa" "while [ 1 ]; do celery worker -A tasks -n worker@%h --broker=redis://localhost:6379; done"
}
function start-pipeline-celery-flower() {
    tmux new-window  -dt pipeline -n "Celery::Flower"    -c "${WORKSPACE}/elsa" "while [ 1 ]; do celery flower -A tasks --broker=redis://localhost:6379 --basic_auth=user:password; done"
}
function start-pipeline-beholder-migrate() {
    tmux new-window  -dt pipeline -n "Beholder Migrate"  -c "${WORKSPACE}/beholder" "echo 'Hit enter to rakedb';read; bundler exec rake db:setup; bundler exec rake db:migrate; read"
}
function start-pipeline-database-migrate() {
    until ncat -z localhost 5432; do
        echo "Waiting for Docker to show an elsa-db"
        sleep 1
    done
    tmux new-window  -dt pipeline -n "Reimage"           -c "${WORKSPACE}/elsa" "make reschema-db"
}

function start-pipeline() {
    tmux new-session -d -s pipeline
    start-pipeline-docker
    start-pipeline-beholder
    start-pipeline-celery-scheduler
    start-pipeline-celery-worker
    start-pipeline-celery-flower

    pipeline


}



