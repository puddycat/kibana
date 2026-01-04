#
# kibana/containers/Dockerfile
#
# raymondstrose@hotmail.com
#
#   Create a Kibana Docker image.
#
#   docker build -f Dockerfile  \
#       --build-arg BASE_IMAGE="kibana" \
#       --build-arg BASE_IMAGE_TAG="9.2.0" \
#       --build-arg KIBANA_VERSION="9.2.0" \
#       -t raymondstrose/kibana:9.2.0 .
#

ARG	KIBANA_VERSION="9.2.0"
ARG	BASE_IMAGE="kibana"
ARG	BASE_IMAGE_TAG="${KIBANA_VERSION}"

FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}
LABEL MAINTAINER=raymondstrose@hotmail.com

ARG	KIBANA_VERSION

COPY opt /opt

#EXPOSE 9092

USER 1001

ENTRYPOINT [ "/opt/kibana/entrypoint" ]
CMD [ "/opt/kibana/run" ]
