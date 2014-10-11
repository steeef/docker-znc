#!/bin/bash
DATADIR="/data"

if [ ! -f "${DATADIR}/configs/znc.conf" ]; then
  mkdir -p "${DATADIR}/configs"
  cp /src/znc.conf.default "${DATADIR}/configs/znc.conf"
fi

chown -R znc. "$DATADIR"

# Start ZNC.
exec su znc -c "znc --foreground --datadir=${DATADIR} $@"
