#!/usr/bin/env bash
set -e -o pipefail

echo "trigger dockerhub builds for Tag $DOCKER_TAG:"

URLS=(
	"https://registry.hub.docker.com/u/consol/ubuntu-xfce-vnc/trigger/bfc5c145-bddf-404c-8ae7-356f928656e9/"
    "https://registry.hub.docker.com/u/consol/centos-xfce-vnc/trigger/6ea7c965-783e-42e7-9219-3346f969aa8d/"
    "https://registry.hub.docker.com/u/consol/ubuntu-icewm-vnc/trigger/c73f3c3f-ecc3-46b1-9766-46c7dfca4d16/"
    "https://registry.hub.docker.com/u/consol/centos-icewm-vnc/trigger/3ea59f8b-364a-4a31-b1f3-aa0201f321d2/"
)
PAYLOAD='{"source_type": "Tag", "source_name": "'$DOCKER_TAG'"}'

if [[ $DOCKER_TAG == "latest" ]] ; then
    echo "DockerHub will not be triggered: use script 'tag_image.sh'"
    #PAYLOAD='{"docker_tag": "'latest'"}'
    exit 0
fi
if [[ $DOCKER_TAG == "dev" ]] ; then
   PAYLOAD='{"docker_tag": "'dev'"}'
fi

#Loop
for URL in "${URLS[@]}"
do
	echo "URL: $URL"
  	echo "PAYLOAD: $PAYLOAD"
    curl -H "Content-Type: application/json" --data "$PAYLOAD" -X POST "$URL"
    echo " - done!"
done