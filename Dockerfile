FROM python:3.10-slim
ENV ANSIBLE_HOST_KEY_CHECKING=False
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    ssh \
    gcc \
    openssh-client \
    libc6-dev \
    build-essential \
    rsyslog \
    libldap2-dev \
    libsasl2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --no-cache-dir ansible bs4 requests python-ldap hvac
WORKDIR /ansible
# COPY ./playbooks /ansible/playbooks # Add your own playbooks in to image
COPY collect.py /usr/local/bin/collect.py
RUN python /usr/local/bin/collect.py

CMD ["ansible-playbook", "--version"]
