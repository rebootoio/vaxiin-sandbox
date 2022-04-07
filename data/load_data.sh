#!/usr/bin/env bash

error_exit() {
  echo "ERROR: $1"
  exit 1
}


if $(which vaxctl > /dev/null 2>&1); then
  VAXCTL="vaxctl"
else
  if [ -f "./vaxctl" ]; then
    VAXCTL="./vaxctl"
    if [ ! -x $VAXCTL ]; then
      error_exit "$VAXCTL not set as executable"
    fi
  else
    error_exit "vaxctl not found in PATH or in local directory"
  fi
fi

for category in cred device action state rule; do
  for resource in $(dirname $0)/${category}/*; do
    if [ -f ${resource} ]; then
      echo $resource
      $VAXCTL apply $category -f ${resource}
    fi
  done
done
