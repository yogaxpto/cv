#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system utilities
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        apt-utils \
        git \
        procps \
        curl

# Install TeX Live (largest dependency - benefits most from caching)
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
        texlive-latex-base \
        texlive-extra-utils \
        texlive-latex-extra \
        biber \
        chktex \
        latexmk \
        make \
        python3-pygments \
        python3-pkg-resources

# Install latexindent Perl dependencies
RUN --mount=type=cache,target=/root/.cpanm,sharing=locked \
    curl -L http://cpanmin.us | perl - App::cpanminus && \
    cpanm Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString

# Cleanup (note: NOT removing /var/lib/apt/lists/* as cache mounts make this unnecessary)
RUN apt-get autoremove -y && \
    apt-get clean -y

ENV DEBIAN_FRONTEND=dialog \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
