#!/bin/bash

# 随机生成一个数字，用户输入一个数字，然后判定，直到判定成功
guessNum() {
  randomNum=$((${RANDOM}%100))
  echo "${randomNum}"
  lastSmall=0
  lastBig=100
  while true; do
    read -p "please input a number in 0 - 100: " num
    # 判断是否是数字
    verifyNum "${num}"
    if [ ! "$?" == 200 ]; then
      continue
    fi
    # 相等了，则输出相等
    if [ "${num}" -eq "${randomNum}" ]; then
      echo "yes, you are right!"
      exit 0
    # 比较和目标值的大小，并给出范围
    # 如果比目标值大，
    elif [ "${num}" -gt "${randomNum}" ]; then
      echo "your number is too big, please input between ${lastSmall} and ${num} "
      lastBig=${num}
    elif [ "${num}" -lt  "${randomNum}" ]; then
      echo "your number is too small, please input between ${num} and ${lastBig} "
      lastSmall=${num}
    fi
  done
}


# 检验是否是数字的函数
verifyNum() {
  local number=$1
  res=$(sed "s/[0-9]//g" <<< ${number})
  if [ -z "${res}" ]; then # res 如果是空字符串，说明是数字，匹配成功
    return "200"
  fi
}

guessNum