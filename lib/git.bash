#!/bin/bash

set -euo pipefail

function repo_from_origin() {
  local origin
  local without_prefix
  local dir

  dir=$(plugin_read_config DIR '')

  if [ ! -Z $dir ]; then
    cd $dir
  fi 

  origin="$(git remote get-url origin)"
  echo $origin
  without_prefix="${origin#*:}"
  echo "${without_prefix%.git}":q!
}
