#!/usr/bin/env bash
for category in cred device action state rule; do
  cd $category
  for resource in *; do
    if [ -f $resource ]; then
      echo $category/$resource
      vaxctl apply $category -f $resource
    fi
  done
  cd ..
done
