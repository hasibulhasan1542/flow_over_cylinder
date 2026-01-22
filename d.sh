#!/usr/bin/bash

set -e

sudo chmod -R a+rw .

echo "Cleaning up everything except core files..."

find . -mindepth 1 -maxdepth 1 ! -name "0" \
    ! -name "constant" \
    ! -name "system" \
    ! -name "d.sh" \
    ! -name "notes.md" \
    ! -name "p.FOAM" \
    ! -name "r.sh" \
    ! -name "p.sh" \
    ! -name "solver.sh" \
    -exec rm -rf {} +

find . -mindepth 1 -name ".*" -print -exec rm -rfv {} +


echo "Cleanup complete."


