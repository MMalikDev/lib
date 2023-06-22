ARG DIND_VERSION=24.0-dind
# ARG DIND_VERSION=24.0-dind-rootless

FROM docker:$DIND_VERSION as builder

# Create a non-privileged user 
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "$UID" \
    dev

# ------------------------------------------------------------ #

FROM builder AS testing
USER dev

COPY . .