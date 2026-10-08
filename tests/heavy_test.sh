#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Medium load and duration test
THREADS=1000
RAMPUP=30
LOOPS=1
SPEED=${1:-normal}

echo "Running medium test"

echo "Script dir: ${SCRIPT_DIR}"
echo "Project dir: ${PROJECT_DIR}"

"${SCRIPT_DIR}/run-test.sh" "$THREADS" "$RAMPUP" "$LOOPS" "$SPEED"
