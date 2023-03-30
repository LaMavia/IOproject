#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1
source ../../scripts/helpers.sh || exit 1
cd .. || exit 1

../server/scripts/dev.sh &

# server_pid=$!

export OP_FINAL="lsof -i :8000 | awk 'NR>1{print \$2}' | xargs kill"
eval "$OP_FINAL"

# op "Running client tests ($server_pid)..." \
#   "npm run test-script" \
#   "Succesfully ran client tests." \
#   "Failed to run client tests."

op "Generating client coverage..." \
  "npm run coverage" \
  "Succesfully ran client coverage." \
  "Failed to run client coverage."