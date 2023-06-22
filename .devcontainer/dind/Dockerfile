FROM bookworm-slim as base

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update  \
    && apt-get -y install git
    
# ------------------------------------------------------------ #

FROM builder AS docker
# If "context" is set to ".." in devcontainer.json, use .devcontainer/library-scripts/*.sh
COPY library-scripts/*.sh /tmp/library-scripts/

ENV DOCKER_BUILDKIT=1
RUN apt-get update && /bin/bash /tmp/library-scripts/docker-in-docker-debian.sh
ENTRYPOINT ["/usr/local/share/docker-init.sh"]
VOLUME [ "/var/lib/docker" ]

# ------------------------------------------------------------ #

FROM docker AS testing
CMD ["sleep", "infinity"]
