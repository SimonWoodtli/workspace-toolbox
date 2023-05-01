FROM quay.io/toolbx-images/ubuntu-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      USAGE="This image is meant to be used with the toolbox or distrobox command" \
      SUMMARY="A cloud-native UNIX terminal experience" \
      MAINTAINER="Simon D. Woodtli <xnasero@posteo.net>" \
      SOURCE="https://github.com/SimonWoodtli/workspace"

COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

COPY build.sh /tmp/build.sh
COPY post-install.sh /tmp/post-install.sh
COPY recipe.yml /tmp/recipe.yml

RUN /tmp/build.sh                                                               
RUN /tmp/post-install.sh

RUN rm -rf /tmp/*
