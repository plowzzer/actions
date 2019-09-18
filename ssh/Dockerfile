FROM debian:stable-slim

LABEL "maintainer"="Bild <administrativoti@bild.com.br>"
LABEL "repository"="https://github.com/bildvitta/actions"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="SSH"
LABEL "com.github.actions.description"="Deploy via SSH"
LABEL "com.github.actions.icon"="server"
LABEL "com.github.actions.color"="orange"

RUN apt-get update && apt-get install -y \
  openssh-client sudo && \
  rm -Rf /var/lib/apt/lists/*


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]