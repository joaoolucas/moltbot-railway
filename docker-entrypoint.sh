#!/bin/bash
set -e

# Force rebuild v2
echo "=== Railway Debug ==="
echo "PORT: $PORT"
echo "PWD: $(pwd)"
echo "NODE_ENV: $NODE_ENV"
echo "CLAWDBOT_STATE_DIR: $CLAWDBOT_STATE_DIR"
echo "CLAWDBOT_WORKSPACE_DIR: $CLAWDBOT_WORKSPACE_DIR"
echo "CLAWDBOT_GATEWAY_TOKEN set: $([ -n "$CLAWDBOT_GATEWAY_TOKEN" ] && echo 'yes' || echo 'no')"
echo "===================="

# Create data directories if needed
mkdir -p "${CLAWDBOT_STATE_DIR:-/data/.clawdbot}"
mkdir -p "${CLAWDBOT_WORKSPACE_DIR:-/data/workspace}"

echo "Testing node..."
node --version

echo "Testing dist/index.js exists..."
ls -la dist/index.js

echo "Starting gateway..."
node dist/index.js gateway --allow-unconfigured --port "${PORT:-8080}" --bind lan 2>&1
