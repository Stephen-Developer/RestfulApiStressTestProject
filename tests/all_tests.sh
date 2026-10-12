#!/bin/bash

# Script that runs every test
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

#The test to run
tests=(
    "smoke_test.sh"
    "light_test.sh"
    "medium_test.sh"
    "heavy_test.sh"
)

#The speeds to run the tests at
profiles=(
    "veryslow"
    "slow"
    ""
)

#Run each test at each speed
for test in "${tests[@]}"
do
    for profile in "${profiles[@]}"
    do
        if [ -n "$profile" ]; then
            "${SCRIPT_DIR}/${test}" "$profile"
            continue
        fi

        "${SCRIPT_DIR}/${test}"
    done
done

echo "Finished Runnning all tests"