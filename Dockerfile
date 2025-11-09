#
# kibana/Dockerfile
#
#   Create an Kibana Docker image.
#
#   docker build -f Dockerfile  \
#       --build-arg BASE_IMAGE="kibana" \
#       --build-arg BASE_IMAGE_TAG="9.2.0" \
#       --build-arg KIBANA_VERSION="9.2.0" \
#       -t raymondstrose/kibana:9.2.0 .
#

ARG	BASE_IMAGE="kibana"
ARG	BASE_IMAGE_TAG="9.2.0"
ARG	KIBANA_VERSION="${BASE_IMAGE_TAG}"

FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}
LABEL MAINTAINER=raymondstrose@hotmail.com

ARG	KIBANA_VERSION
