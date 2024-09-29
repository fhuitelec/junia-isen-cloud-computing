FROM mcr.microsoft.com/devcontainers/base:ubuntu22.04

RUN apt update \
    && apt install -y \
        vim \
        curl \
        gnupg \
        wget \
        software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null \
    && gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint --with-colons | grep 'fpr:::::::::798AEC654E5C15428C8E42EEAA16FCBCA621E701:'

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        tee /etc/apt/sources.list.d/hashicorp.list \
    &&apt update \
    && apt install -y \
        terraform \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:0.4 /uv /bin/uv
RUN uv python install 3.12
