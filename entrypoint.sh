#!/bin/bash
DATADIR="/data"

# Create default config if it doesn't exist
if [ ! -f "${DATADIR}/configs/znc.conf" ]; then
  mkdir -p "${DATADIR}/configs"
  cp /src/znc.conf.default "${DATADIR}/configs/znc.conf"
fi

# Make sure $DATADIR is owned by znc user. This effects ownership of the
# mounted directory on the host machine too.
chown -R znc:znc "$DATADIR"

# Start ZNC.
exec sudo -u znc znc --foreground --datadir="$DATADIR" $@
