#!/bin/bash
# Docker Buildx command for Mosquitto
# !OBS: This Image is actually not built here, I use the image from
# eclipse-mosquitto
#
docker buildx build --file dockerfile  --platform linux/arm -t jagdriver/snakeapps:mosquitto --push . 