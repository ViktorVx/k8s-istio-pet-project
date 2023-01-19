#!/bin/sh
img="${APP_TAG}":"${APP_VERSION}"
docker build -t "${img}" .
docker login --username "${USER_NAME}" --password "${USER_PASSWORD}" "${DOCKER_SERVER}"
docker push "${img}"