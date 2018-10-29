#!/usr/bin/env bash
set -e -o pipefail


if [ -z $GIT_BRANCH ] ; then
    GIT_BRANCH=$TRAVIS_BRANCH
fi
if [ -z $GIT_BRANCH ] ; then
    echo "cloud not execute script! Please specify at least on environment variable of: GIT_BRANCH, TRAVIS_BRANCH"
    exit -1
fi

echo "branch=$GIT_BRANCH"
GIT_BRANCH=${GIT_BRANCH/origin\/}
DOCKER_TAG="${GIT_BRANCH/refs\/tags\/}"

if [[ $DOCKER_TAG == "master" ]] ; then
   echo "skip building latest tag!"
   echo "... use 'tag_image.sh' script to release a new version. See: https://github.com/ConSol/docker-headless-vnc-container/blob/master/how-to-release.md"
   exit 0
fi

echo "DOCKER_TAG=$DOCKER_TAG"
echo "..."
echo "trigger dockerhub builds for Tag $DOCKER_TAG:"

URLS=(
	"https://registry.hub.docker.com/u/consol/ubuntu-xfce-vnc/trigger/bfc5c145-bddf-404c-8ae7-356f928656e9/"
    "https://registry.hub.docker.com/u/consol/centos-xfce-vnc/trigger/6ea7c965-783e-42e7-9219-3346f969aa8d/"
    "https://registry.hub.docker.com/u/consol/ubuntu-icewm-vnc/trigger/c73f3c3f-ecc3-46b1-9766-46c7dfca4d16/"
    "https://registry.hub.docker.com/u/consol/centos-icewm-vnc/trigger/3ea59f8b-364a-4a31-b1f3-aa0201f321d2/"
)
PAYLOAD='{"source_type": "Tag", "source_name": "'$DOCKER_TAG'"}'

# use docker tag instead of branch
if [[ $DOCKER_TAG == "dev" ]] ; then
   PAYLOAD='{"docker_tag": "'dev'"}'
fi

# use first parameter to filter trigger command
IMAGENAME=$1

#Loop
for URL in "${URLS[@]}"
do
    if [ -z $IMAGENAME ] || [[ $URL =~ .*"$IMAGENAME".* ]] ; then
        echo "URL: $URL"
        echo "PAYLOAD: $PAYLOAD"
        curl -H "Content-Type: application/json" --data "$PAYLOAD" -X POST "$URL"
        echo " - done!"
    fi
done