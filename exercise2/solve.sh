#!/bin/bash

sendMail() {
  echo "begin send mail"
  echo "$1"
  echo "send mail successful"
}

# 判断获取的 ping通率是否合法
judgeNum() {
  n=$1
  echo "judgeNum n $n"
  # 判断字符串是否为空，如果为空，报警错误
  if [ -z "$n" ]; then
    sendMail "获取的ping 通率百分比为空，请确认"
    exit 1
  fi
  # 判断是不是数字
  n1=$(echo $n | sed 's/[0-9.]//g') # 需要把$n1 变成标准输入
  echo "经过 sed 之后的值为：$n1"
  if [ -n "$n1" ]; then
    sendMail "获取的 ping通率不是纯数字，请检查"
    exit 1
  fi
  # 验证是数字之后， 如果数字是小数，转为整数，返回
  float=$(echo "$n" | grep .)
  echo "float $float"
  if [ -n "$float" ]; then
    # 证明是小数
    int=$(echo "$n" | awk -F '.' '{print $1}')
    return "$int"
  else
    return "$n"
  fi
}

# 判断 ping通率是不是我们需要的数字
judgePing() {
  num=$1
  echo "judgePing num $num"
  if [ "$num" -gt 50 ]; then
    sendMail "ping通率太低为 $num, 请检查"
  else
    echo "ping通率正常， 丢包率为 $num ,可以放心使用"
  fi
}

# 使用 $1 从 cmd 里获取对应参数
main() {
  ip=$1
  aim=$(ping -c5 "$ip" | grep packet | awk -F '%' '{print $1}' | awk '{print $NF}')
  judgeNum "$aim"
  # 注意事项，函数的返回值，需要使用 $? 获得
  percent=$?
  judgePing $percent
}

main $1
