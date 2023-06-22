ARG VERSION=bookworm-slim
FROM debian:$VERSION as builder

WORKDIR /code

RUN apt update && apt upgrade -y
# RUN apt install -y 

# Create a non-privileged user 
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "$UID" \
    code

# ------------------------------------------------------------ #

FROM builder AS testing
# USER code

COPY . .

CMD ["sleep", "infinity"]
