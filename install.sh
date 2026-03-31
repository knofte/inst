#!/bin/sh
#
# install.sh - install inst to your system
#

set -e

PREFIX="${PREFIX:-/usr/local}"
BINDIR="$PREFIX/bin"
CONF="/etc/inst.conf"

echo "Installing inst to $BINDIR/inst"
cp inst "$BINDIR/inst"
chmod +x "$BINDIR/inst"

if [ ! -f "$CONF" ]; then
    echo "Installing default config to $CONF"
    cp inst.conf.example "$CONF"
fi

echo "Running initial package list update..."
"$BINDIR/inst" update

echo "Done. Try: inst search vim"
