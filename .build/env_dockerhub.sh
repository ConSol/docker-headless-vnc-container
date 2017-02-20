#!/usr/bin/env bash
### used in jenkins to set correct env vars

echo "branch= $GIT_BRANCH"
GIT_BRANCH=${GIT_BRANCH/origin\/}
echo "DOCKER_TAG=${GIT_BRANCH/feature\/#}" > $WORKSPACE/myjob.properties
