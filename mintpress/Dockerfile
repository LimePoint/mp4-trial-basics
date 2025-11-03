
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

### ---- Default runner image configuration part 2 ----
COPY --link --chown=10001:10001 --from=trust_store / /etc/pki/ca-trust/source/anchors
COPY --link --chown=10001:10001 --from=repo / /opt/opschain/

ARG GIT_REV
ENV GIT_REV=$GIT_REV

ARG GIT_SHA
RUN opschain_configure_project_repo.sh "$GIT_SHA"

USER opschain
RUN --mount=type=secret,required=true,id=env_context_zip,uid=10001,gid=10001,target=/opt/opschain/.mintpress/step_context.json.zip \
    --mount=type=secret,required=false,id=mintpress_license,uid=10001,gid=10001,target=/opt/opschain/.environmint/mintpress.license \
    bundle_and_lint.sh
### ----