#!/bin/bash

# Script that runs every test
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"${SCRIPT_DIR}/smoke_test.sh" "veryslow"
"${SCRIPT_DIR}/smoke_test.sh" "slow"
"${SCRIPT_DIR}/smoke_test.sh"
"${SCRIPT_DIR}/light_test.sh" "veryslow"
"${SCRIPT_DIR}/light_test.sh" "slow"
"${SCRIPT_DIR}/light_test.sh"
"${SCRIPT_DIR}/medium_test.sh" "veryslow"
"${SCRIPT_DIR}/medium_test.sh" "slow"
"${SCRIPT_DIR}/medium_test.sh"
"${SCRIPT_DIR}/heavy_test.sh" "veryslow"
"${SCRIPT_DIR}/heavy_test.sh" "slow"
"${SCRIPT_DIR}/heavy_test.sh"

echo "Finished Runnning all tests"