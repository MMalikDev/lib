# Paperless Configs

- The UID and GID of the user used to run paperless in the container. Set this
  to your UID and GID on the host so that you have write access to the
  consumption directory.

  ```bash
  USERMAP_UID=$(id -u)
  USERMAP_GID=$(id -g)
  ```

- Additional languages to install for text recognition, separated by a
  whitespace. Note that this is
  different from PAPERLESS_OCR_LANGUAGE (default=eng), which defines the
  language used for OCR.

  The container installs English, German, Italian, Spanish and French by
  default.

  > See [debian.org](https://packages.debian.org/search?keywords=tesseract-ocr-&searchon=names&suite=buster)
  > for available languages.

  ```bash
  # PAPERLESS_OCR_LANGUAGES=tur ces
  ```

## Paperless-specific settings

All settings defined in the paperless.conf.example can be used here.
The Docker setup does not use the configuration file.

A few commonly adjusted settings are provided below.

- This is required if you will be exposing Paperless-ngx on a public domain

  > If doing so please consider security measures such as reverse proxy

  ```bash
  PAPERLESS_URL=http://webserver.localhost
  ```

- Adjust this key if you plan to make paperless available publicly. It should
  be a very long sequence of random characters.

  > You don't need to remember it.

  ```bash
  PAPERLESS_SECRET_KEY=$(head -c32 /dev/urandom | base64)
  ```

- Use this variable to set a timezone for the Paperless Docker containers. If not specified, defaults to UTC.

  ```bash
  # PAPERLESS_TIME_ZONE=America/Los_Angeles
  ```

- The default language to use for OCR. Set this to the language most of your
  documents are written in.

  ```bash
  # PAPERLESS_OCR_LANGUAGE=eng
  ```

- Set if accessing paperless via a domain subpath e.g. https://domain.com/PATHPREFIX and using a reverse-proxy like traefik or nginx

  ```bash
  # PAPERLESS_FORCE_SCRIPT_NAME=/PATHPREFIX
  # PAPERLESS_STATIC_URL=/ # trailing slash required
  ```

## Paperless Setup

Docker Compose file for running paperless from the docker container registry.

This file contains everything paperless needs to run.

Paperless supports amd64, arm and arm64 hardware.

All compose files of paperless configure paperless in the following way:

- Paperless is (re)started on system boot, if it was running before shutdown.
- Docker volumes for storing data are managed by Docker.
- Folders for importing and exporting files are created in the same directory
  as this file and mounted to the correct folders inside the container.
- Paperless listens on port 8000.

In addition to that, this Docker Compose file adds the following optional
configurations:

- Instead of SQLite (default), PostgreSQL is used as the database server.
- Apache Tika and Gotenberg servers are started with paperless and paperless
  is configured to use these services. These provide support for consuming
  Office documents (Word, Excel, Power Point and their LibreOffice counter-
  parts).

To install and update paperless with this file, do the following:

- Copy this file as 'docker-compose.yml' and the files 'docker-compose.env'
  and '.env' into a folder.
- Run 'docker compose pull'.
- Run 'docker compose run --rm webserver createsuperuser' to create a user.
- Run 'docker compose up -d'.

> For more extensive installation and update instructions, refer to the documentation.
