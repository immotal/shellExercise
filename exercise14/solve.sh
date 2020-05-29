#!/bin/bash

outputNum() {
  lastN=0
  while true; do
    read -p "please input a number: " n
    # 判断数字
    if [ "${n}" == "q" ] || [ "${n}" == "Q" ]; then
      exit 0
    fi
    res=$(sed "s/[0-9]//g" <<< "${n}")
    # 经过替换后，输出结果如果是空字符串的话代表是数字，不然的不是数字
    if [ -n "${res}" ]; then
      echo "your input is not a number "
      continue
    elif [ "${n}" -lt "${lastN}" ]; then
      echo "you must input num greater than ${lastN} "
      continue
    else
      # 输出数字
      for i in $(seq $((${lastN}+1)) "${n}"); do
        if [ "${i}" -eq "${n}" ]; then  # 末尾的数字不处理
          echo -n "${i}."
        else
          # -n 代表不换行
          echo -n "${i}, "
        fi
      done
      # 下面这个 echo 相当于输出一个换行
      echo
      lastN="${n}"
    fi
  done
}


outputNum