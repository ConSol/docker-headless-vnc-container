#!/usr/bin/env bash
set -e -o pipefail

SRC_TAG=$1
TARGET_TAG=$2
echo "tag $SRC_TAG -> $TARGET_TAG"
if [[ $SRC_TAG == "" ]] || [[ $TARGET_TAG == "" ]] ; then
  echo "ERROR: execute script like: tag_image.h <src-tag> <target-tag>"
  exit -1
fi

IMAGES=(
	"consol/ubuntu-xfce-vnc"
    "consol/centos-xfce-vnc"
    "consol/ubuntu-icewm-vnc"
    "consol/centos-icewm-vnc"
)

#Loop
for IMAGE in "${IMAGES[@]}"
do
	echo "IMAGE: $IMAGE:$SRC_TAG"
	docker pull $IMAGE:$SRC_TAG
	docker tag $IMAGE:$SRC_TAG $IMAGE:$TARGET_TAG
	docker push $IMAGE:$TARGET_TAG
    echo " - done!"
done