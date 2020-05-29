#!/bin/bash

pfile="/tmp/pidfile.txt"

getAllPid() {
  ps aux | sed '1d' | awk '{print $2}' > "${pfile}"
}

judgePid() {
  while read line; do
    if [ ! -d /proc/"${line}" ]; then
      echo "this pid ${line} is not in proc, chekc it"
    fi
  done < "${pfile}"
}

clearfile() {
  [ -e "${pfile}" ] && rm -rf "${pfile}"
}

getAllPid
judgePid
clearfile