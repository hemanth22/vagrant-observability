#!/bin/bash
set -euo pipefail
LOGFILE="/grafana/prod/apps/logs/grafana.log"
BINARY="/grafana/prod/apps/bin/grafana"
CONFIG="/grafana/prod/apps/etc/custom.ini"
DATAPATH="/grafana/prod/apps/data"
export GF_LOG_MODE=console
export GF_LOG_LEVEL=info
export GF_LOG_FILE="${LOGFILE}"
export GF_PATHS_DATA="${DATAPATH}"
# Check executable
if [ ! -x "${BINARY}/bin/grafana-server" ]; then
  echo "ERROR: grafana-server not found or not executable: ${BINARY}/bin/grafana-server" >&2
  exit 1
fi
# Start Grafana in background and redirect output
"${BINARY}/bin/grafana-server" web --config="${CONFIG}" > "${LOGFILE}" 2>&1 &
echo "Grafana started with PID $!"