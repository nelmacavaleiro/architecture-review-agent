#!/usr/bin/env bash
set -euo pipefail
script="${BASH_SOURCE[0]//\\//}"
here="$(cd "$(dirname "$script")" && pwd)"
if [ ! -d "$here/fixtures" ]; then
  echo "fixtures folder not found next to $script" >&2
  exit 1
fi
cp -R "$here/fixtures/." .
