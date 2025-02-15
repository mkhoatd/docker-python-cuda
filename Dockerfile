FROM nvidia/cuda:12.1.1-runtime-ubuntu22.04

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY --from=ghcr.io/mkhoatd/docker-vscode-cuda:latest /workspace /workspace

# hadolint ignore=DL3008
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y --no-install-recommends \
  # tools & required packages
  git curl wget ca-certificates fish \
  # clean up
  && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]
