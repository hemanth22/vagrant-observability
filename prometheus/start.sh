#!/bin/bash
LOGFILE="/prometheus/prod/apps/logs/prometheus.log"
BINARY="/prometheus/prod/apps/bin/prometheus"
CONFIG="/prometheus/prod/apps/etc/prometheus.yml"
DATAPATH="/prometheus/prod/apps/data"
exec ${BINARY}/prometheus --config.file="${CONFIG}" --storage.tsdb.path="${DATAPATH}" --web.listen-address=0.0.0.0:9090 >> "${LOGFILE}" 2>&1 &
echo "Prometheus started with PID $!"
