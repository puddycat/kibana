#
# kibana/containers/kibana/ubuntu/Dockerfile.builder
#
# raymondstrose@hotmail.com
#
#   Create an Elasticsearch Docker image.
#
#   docker build -f Dockerfile  \
#       --build-arg BASE_IMAGE="ubuntu" \
#       --build-arg BASE_IMAGE_TAG="20.04" \
#       --build-arg KIBANA_VERSION="9.2.0" \
#       -t raymondstrose/kibana:9.2.0 .
#

ARG	BASE_IMAGE="ubuntu"
ARG	BASE_IMAGE_TAG="20.04"
ARG	GIT_REPO_TAG="v9.2.0"
ARG	KIBANA_VERSION="9.2.0"

FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG} AS build-platform
LABEL MAINTAINER=raymondstrose@hotmail.com

ARG	KIBANA_VERSION
ARG	GIT_REPO_TAG
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common git;
RUN apt-get install -y gradle default-jdk;
RUN git clone https://github.com/elastic/kibana.git --branch=${GIT_REPO_TAG};
RUN cd kibana;	\
	./gradlew localDistro;
RUN cd kibana;	\
	CONFIG_DEFAULT_DIR="/kibana/build/distribution/local/kibana-${KIBANA_VERSION}-SNAPSHOT/config.default";	\
	[ -d $CONFIG_DEFAULT_DIR ] || mkdir $CONFIG_DEFAULT_DIR;
