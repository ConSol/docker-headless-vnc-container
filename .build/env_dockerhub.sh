#!/usr/bin/env bash
### used in jenkins to set correct env vars

echo "branch= $GIT_BRANCH"
GIT_BRANCH=${GIT_BRANCH/origin\/}
DTAG="${GIT_BRANCH/feature\/#}"
DTAG="${GIT_BRANCH/refs\/tags\/}"


if [[ $DTAG == "master" ]] ; then
   DTAG='latest'
fi

echo "DOCKER_TAG=$DTAG"
### will be read out by jenkins
echo "DOCKER_TAG=$DTAG" > $WORKSPACE/myjob.properties