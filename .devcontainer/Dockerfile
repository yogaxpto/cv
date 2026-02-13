FROM ubuntu:24.04 AS dev_container_auto_added_stage_label

ENV DEBIAN_FRONTEND=noninteractive

# Install system utilities and TeX Live packages
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
        apt-utils \
        git \
        procps \
        curl \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-fonts-recommended \
        chktex \
        latexmk

# Cleanup (note: NOT removing /var/lib/apt/lists/* as cache mounts make this unnecessary)
RUN apt-get autoremove -y && \
    apt-get clean -y

ENV DEBIAN_FRONTEND=dialog \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
