#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

FIFO=/tmp/mc.stdin
PID=""

cleanup() {
  {
    echo "save-all flush"
    echo "say Server stopping..."
    echo "stop"
  } > "$FIFO" || true
  [ -n "${PID:-}" ] && wait "$PID" || true
}
trap cleanup SIGTERM SIGINT

rm -f "$FIFO"
mkfifo "$FIFO"
tail -f /dev/null > "$FIFO" &
HOLDER=$!

./run.sh nogui < "$FIFO" &
PID=$!
wait "$PID"
RC=$?

kill "$HOLDER" 2>/dev/null || true
rm -f "$FIFO"
exit "$RC"