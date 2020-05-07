#!/bin/bash

file="/tmp/sedfile"

dealSedFile() {
  # 主要是 sed 的用法, sed 的用法公式
  # sed 参数 '范围 操作' 文件
  sed -n '1,10 p' "$file" | sed '/[a-zA-Z]/d'
  sed -n '11,$p' "$file" | sed 's/[a-zA-Z]//g'
}

dealSedFile