FROM python:alpine3.20

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apk update && \
    apk add --no-cache \
    build-base \
    ca-certificates \
    cyrus-sasl-dev \
    gcc \
    git \
    libc-dev \
    mariadb-dev \
    openldap-dev \
    openssh \
    openssh-client \
    rsync \
    rsyslog \
    sshpass \
    zip

RUN pip install --upgrade pip && \
    pip install --no-cache-dir ansible beautifulsoup4 requests ldap3 hvac mysqlclient

WORKDIR /ansible

COPY collect.py /usr/local/bin/collect.py

RUN python /usr/local/bin/collect.py

CMD ["ansible-playbook", "--version"]
