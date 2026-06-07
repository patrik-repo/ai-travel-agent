#!/bin/bash
# Install trvl MCP server for Travel Agent
# One-command setup for the canonical travel MCP

set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"

echo "Downloading trvl MCP server..."
LATEST_URL=$(curl -s https://api.github.com/repos/MikkoParkkola/trvl/releases/latest | \
    grep -oP '"browser_download_url":\s*"\K[^"]*linux_amd64[^"]*tar\.gz' | head -1)

if [ -z "$LATEST_URL" ]; then
    echo "ERROR: Could not find Linux AMD64 binary"
    exit 1
fi

cd /tmp
curl -sLO "$LATEST_URL"
tar xzf trvl_*_linux_amd64.tar.gz
cp trvl "$INSTALL_DIR/"
rm -f trvl trvl_*.tar.gz

echo "trvl installed to $INSTALL_DIR/trvl"
"$INSTALL_DIR/trvl" version
echo "Done! Add 'trvl mcp' to your Hermes MCP config."
