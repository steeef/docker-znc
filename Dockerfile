FROM debian:latest
MAINTAINER Stephen Price "steeef@gmail.com"

RUN buildDeps=" \
    build-essential \
    curl \
    libperl-dev \
    libssl-dev \
    pkg-config \
    "; \
    apt-get-update && apt-get install -y --no-install-recommends $buildDeps \
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

RUN useradd znc \
    && mkdir -p /data/configs \
    && ln -s /data /home/znc/.znc \
    && chown -R znc. /data \
    && [ ! -f /data/configs/znc.conf ] \
    && sudo -u znc znc --makeconf

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 6667
