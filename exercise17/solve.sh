#!/bin/bash

downLoad() {
  url=$1
  pth=$2
  # 检测地址是否存在
  if [ ! -d "${pth}" ]; then
    read -p "directory is not exist, confirm create it ? Y/N " flag
    case "${flag}" in
      Y|y)
        echo "confirm create this dir"
        mkdir "${pth}"
        ;;
      N|n)
        echo "do not create this dir "
        exit 51
    esac
  fi
  dld
}

dld() {
  # 测试 URL 是否可用 https://www.cnblogs.com/peida/archive/2013/03/18/2965369.html
  cd "${pth}"
  wget "${url}" "${pth}"
  if [ ${?} == 0 ]; then
    echo "dwonload successful"
  else
    exit 52
  fi
}

downLoad $1 $2
