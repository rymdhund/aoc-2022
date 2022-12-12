#!/bin/bash

set -euo pipefail

here=$(pwd)

cd ../wosh
go build cmd/wosh/wosh.go
cd $here

for file in $(ls day*.wosh); do
  echo "running $file"

  libs=()
  for lib in $(grep '#!import' $file | cut -d" " -f2); do
    libs+=("$lib")
  done

  ../wosh/wosh ${libs[*]} $file
done
