FROM debian:latest
MAINTAINER Stephen Price "steeef@gmail.com"

RUN buildDeps=" \
    build-essential \
    curl \
    libperl-dev \
    libssl-dev \
    pkg-config \
    "; \
    apt-get update && apt-get install -y --no-install-recommends \
    $buildDeps \
    libssl1.0.0 \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && curl -SL "http://znc.in/releases/archive/znc-1.4.tar.gz" -o znc.tar.gz \
    && mkdir -p /src/znc \
    && tar -zxvf znc.tar.gz -C /src/znc --strip-components=1 \
    && rm -f znc.tar.gz* \
    && cd /src/znc \
    && ./configure \
    && make -j"$(nproc)" \
    && make install \
    && cd / \
    && rm -rf /src/znc \
    && apt-get purge -y $buildDeps \
    && apt-get autoremove -y

RUN useradd znc

COPY znc.conf.default /src/znc.conf.default
COPY entrypoint.sh /entrypoint.sh

EXPOSE 6667

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
