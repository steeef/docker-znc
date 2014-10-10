#!/bin/bash
set -e

exec sudo -u znc znc --foreground --datadir="/data" $@
