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
ARG UID=1001
ARG GID=1001

FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG} AS build-platform
LABEL MAINTAINER=raymondstrose@hotmail.com

ARG	KIBANA_VERSION
ARG	GIT_REPO_TAG
ARG UID
ARG GID
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common git curl npm;
#RUN apt-get install -y gradle default-jdk;

RUN groupadd --gid ${GID} kibana
RUN useradd	\
		--uid ${UID} --gid ${GID}	\
		--create-home --home-dir /home/kibana	\
		--shell /bin/bash	\
		kibana

RUN ls -l /home

RUN	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash;	\
	export NVM_DIR=$HOME/.nvm;	\
	export PATH=$NVM_DIR:$PATH;	\
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh";	\
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion";	\
	find / -name '*nvm*' 2>/dev/null;	\
	cat ~/.bashrc;	\
	ls -l "$NVM_DIR/nvm.sh";	\
	cat "$NVM_DIR/nvm.sh";	\
	npm install -g yarn;	\
	ls -l /usr/local/bin;

USER ${UID}

#RUN cd /home/kibana;	\
#	git clone https://github.com/elastic/kibana.git --branch=${GIT_REPO_TAG};

# Install NVM (use the latest version from the NVM GitHub page)
# NOTE: Removed ". ~/.bashrc" as we are running bourne shell at this point.
RUN cd kibana;	\
	nvm install 22.17.1;	\
	nvm use 22.17.1;	\
	yarn set version 1.22.22;	\
	yarn kbn bootstrap
#RUN cd kibana;	\
#	CONFIG_DEFAULT_DIR="/kibana/build/distribution/local/kibana-${KIBANA_VERSION}-SNAPSHOT/config.default";	\
#	[ -d $CONFIG_DEFAULT_DIR ] || mkdir $CONFIG_DEFAULT_DIR;
