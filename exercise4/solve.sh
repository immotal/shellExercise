#!/bin/bash

basePath="/tmp/dateInfo/"

generateDate() {
  if [ ! -d "$basePath" ]; then
    mkdir "$basePath"
  fi
  name=$(date +%F)
  aimFile="${basePath:?}""$name"
  if [ ! -e "$aimFile" ]; then
    touch "$aimFile"
  fi
  df -h > "$aimFile"
}

generateDate