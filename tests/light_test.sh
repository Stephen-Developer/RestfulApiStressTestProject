#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Light load and duration test
THREADS=10
RAMPUP=10
LOOPS=1
SPEED=${1:-normal}

echo "Running light test"

echo "Script dir: ${SCRIPT_DIR}"
echo "Project dir: ${PROJECT_DIR}"

"${SCRIPT_DIR}/run-test.sh" "$THREADS" "$RAMPUP" "$LOOPS" "$SPEED"
