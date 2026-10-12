#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Smoke test to ensure the test is functional
THREADS=1
RAMPUP=1
LOOPS=1
SPEED=${1:-normal}

echo "Running smoke test"

"${SCRIPT_DIR}/run-test.sh" "$THREADS" "$RAMPUP" "$LOOPS" "$SPEED"
