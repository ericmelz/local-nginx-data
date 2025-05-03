#!/bin/bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONF_FILE="$PROJECT_ROOT/conf/nginx.conf"
DEST_DIR=/usr/local/etc/nginx

echo "Moving $DEST_DIR/nginx.conf to $DEST_DIR/nginx.conf.bak"
mv $DEST_DIR/nginx.conf $DEST_DIR/nginx.conf.bak

echo "Copying $CONF_FILE to $DEST_DIR"
cp $CONF_FILE $DEST_DIR

echo "Restarting nginx"
brew services restart nginx

echo "Done!"
