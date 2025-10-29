# syntax = docker/dockerfile:1.4

ARG OPSCHAIN_BASE_RUNNER

FROM scratch AS repo
ADD ./repo.tar .

FROM scratch AS trust_store
ADD ./opschain-trust-store.tar .

FROM ${OPSCHAIN_BASE_RUNNER}
### ----

### Custom configuration
# Install Python 3 and the pip package manager
RUN dnf install -y python3 python3-pip python3-requests && \
    alternatives --install /usr/bin/python python /usr/bin/python3 1
### ----