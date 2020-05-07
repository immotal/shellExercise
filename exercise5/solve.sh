#!/bin/bash

logPath="/tmp/log"

countLog() {
  # 因为 AWK 只能接受标准输入，所以需要将 echo 的内容用 xargs 变为相应的标准输入
  # sort 和 uniq 的用法具体见 des
  echo "$logPath" | xargs awk '{print $1}' | sort -n | uniq -c | sort -n -r
}

countLog
