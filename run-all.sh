#!/bin/bash

set -euo pipefail

for f in $(ls day*.wosh); do
  echo "running $f"
  ./run.sh $f
done
