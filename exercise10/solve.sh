#!/bin/bash

countUser() {
  if [ -z "$1" ]; then
    echo "系统没有其他普通用户"
  else
    echo "系统有 $1 个其他用户"
  fi
}

# 我们默认系统的版本中 1-999 号 UID 是预留该系统账号的，1000 以上的 UID 号是给普通可登录账号的

getUserNum() {
  n=$(awk -F ':' '$3>999 {print $3}' /etc/passwd | wc -l)
  echo "$n"
  return "$n"
}

getUserNum
countUser "$?"