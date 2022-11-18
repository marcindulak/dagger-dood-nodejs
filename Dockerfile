FROM node:18-alpine

# Set the UID/GID of the "node" user to the IDs of the user using this Dockerfile
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN echo $USER_UID:$USER_GID
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then \
        apk update \
        && apk add shadow \
        && groupmod --non-unique --gid $USER_GID node \
        && usermod --uid $USER_UID --gid $USER_GID node \
        && chown -R $USER_UID:$USER_GID /home/node; \
    fi

# Install docker-cli
RUN apk update \
    && apk add shadow docker-cli \
    && rm -rf /var/cache/apk/*

# Allow node to execute docker commands without sudo
RUN addgroup -S docker && adduser node docker

# Configure sudo
RUN apk update \
    && apk add sudo \
    && rm -rf /var/cache/apk/*
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel
RUN adduser node wheel && sudo -lU node

USER node

WORKDIR /app

CMD ["sleep", "infinity"]
