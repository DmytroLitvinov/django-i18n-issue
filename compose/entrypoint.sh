#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

readonly cmd="$@"

sleep infinity;

# Evaluating passed command (do not touch):
# shellcheck disable=SC2086
exec $cmd
