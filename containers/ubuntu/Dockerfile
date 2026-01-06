#
# kibana/containers/ubuntu/Dockerfile
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

# Set your platform variables (adjust as needed)
#ARG YQ_VERSION=v4.2.0
ARG YQ_VERSION=v4.48.2
ARG YQ_PLATFORM=linux_amd64


FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}
LABEL MAINTAINER=raymondstrose@hotmail.com

ARG	KIBANA_VERSION
ENV APP_VERSION="${KIBANA_VERSION}" \
    BITNAMI_APP_NAME="kibana" \
    IMAGE_REVISION="2" \
    PATH="/opt/kibana/bin:$PATH"

RUN apt-get update && apt-get install -y wget curl
RUN apt-get install -y net-tools nmap

# Download compressed binary
#RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_${YQ_PLATFORM}.tar.gz -O - | tar xz &&	\
#	sudo mv yq_${PLATFORM} /usr/local/bin/yq &&	\
#	chmod +x /usr/local/bin/yq

# Or download plain binary
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_${YQ_PLATFORM} -O /usr/local/bin/yq &&	\
	chmod +x /usr/local/bin/yq

COPY opt /opt

USER root
RUN /opt/bin/postunpack

#EXPOSE 9092

USER 1001

ENTRYPOINT [ "/opt/bin/entrypoint" ]
CMD [ "/opt/bin/run" ]
