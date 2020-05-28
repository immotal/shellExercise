#!/bin/bash

CONTENT1="just test this file
1234
2
------
soooooooooooooooo
8
7
lalalaldemaxiya
111111111111111
22222222222222
333333333333333
44444444444444
"

CONTENT2="When you are old and grey and full of sleep,

And nodding by the fire, take down this book,

And slowly read, and dream of the soft look

Your eyes had once, and of their shadows deep;

How many loved your moments of glad grace,

And loved your beauty with love false or true,

But one man loved the pilgrim Soul in you,

And loved the sorrows of your changing face;

And bending down beside the glowing bars,

Murmur, a little sadly, how Love fled

And paced upon the mountains overhead

And hid his face amid a crowd of stars.
"

FILE1="/tmp/1.txt"
FILE2="/tmp/2.txt"
FILE2TMP="/tmp/2.txt.tmp"
FILECOUNTNUM="/tmp/countwordnum.txt"

# 判断1 是否大于五行，将 2 去掉空格，并合并至 1.txt 的 5 行后
add2txt() {
  # || 前一个命令失效，后一个命令才执行
  # 判断文件是否存在，不存在就创建
  [ -e "${FILE1}" ] || touch "${FILE1}"
  [ -e "${FILE2}" ] || touch "${FILE2}"

  # 不论在不在，都清空，然后追加对应内容
  > "${FILE1}" && echo "${CONTENT1}" > "${FILE1}"
  > "${FILE2}" && echo "${CONTENT2}" > "${FILE2}"

  # 判断里面的行数是否对
  line1num=$(awk '{print $0}' "${FILE1}" | wc -l | awk '{print $1}')
  line2num=$(awk '{print $0}' "${FILE2}" | wc -l | awk '{print $1}')
  echo "file 1 is ${line1num}"
  echo "file 2 is ${line2num}"

  # 处理 file2 将空行都删除
  > "${FILE2TMP}"
  while read line; do
    if [ "${line}" ]; then
      echo "${line}" >> "${FILE2TMP}"
    fi
  done < "${FILE2}"

  # 判断 5 行, 如果 5 行，放到 5 行后，如果不是，放到文件最后
  if [ "${line1num}" -gt 5 ]; then # if file 1 more than 5, append file 2 to 5 line
    sed -i "" "5r ${FILE2TMP}" "${FILE1}"
  else  # 不然就放到末尾
    sed -i "" "$ r ${FILE2TMP}" "${FILE1}"
  fi
}

# 打印只有一个数字的
printOneNum() {
  # 利用 sed 去做
  while read line;
  do
    # wc 的用法, -w 统计单词数量, 只要出现 wc， 一定记得用 AWK
    # sed 替换，把开头匹配的一个数字替换为空
    tmp=$(sed "s/^[0-9]//g" <<< "${line}" | wc -w | awk '{print $1}')
    # 注意使用综合判断时，需要使用 [] && [] 的形式使用，如果有正则，需要使用 [[]]
    if [ "${tmp}" == 0 ] && [ -n "${line}" ]; then
      echo "single num is ${line}"
    fi
  done < "${FILE1}"
}

printTable() {
  while true; do
    read -p "please input a num: " n
    # 判断是否合法，是否小于 10
    len=$(sed "s/[0-9]//g" <<< "${n}" | wc -w | awk '{print $1}')
    if [ "${len}" == 0 ] && [ "${n}" -gt 10 ]; then
      echo "please input a less than 10 num"
      continue
    elif [ "${len}" == 0 ] && [ "${n}" -lt 10 ]; then
      echo "your number is right, begin print square "
      printSquare "${n}"
      echo "print square finished "
      break
    else
      echo "please input a number, not other thing"
    fi
  done
}

printSquare() {
  local n=$1 #  函数参数
  for i in $(seq 1 "${n}"); do
    for j in $(seq 1 "${n}"); do
      echo -n "■ "
    done
    echo
  done
}

countWord() {
  # 将单词导入对应的文件
  while read line; do
    # 迭代一行中的所有的单词
    # https://blog.csdn.net/ljianhui/article/details/9344689
    for word in ${line}; do
      echo "${word}" >> "${FILECOUNTNUM}"
    done
  done < "${FILE2}"
  # 单词文件将,.等删除
  sed -i "" "s/[,.]//g" "${FILECOUNTNUM}"
  cat "${FILECOUNTNUM}" | sort | uniq -c | sort -nr | awk '$1 > 5 {print $0}'
}

# 删除对应的文件
tearDown() {
  [ -e "${FILE1}" ] && > "${FILE1}"
  [ -e "${FILE2}" ] && > "${FILE2}"
  [ -e "${FILE2TMP}" ] && > "${FILE2TMP}"
  [ -e "${FILECOUNTNUM}" ] && > "${FILECOUNTNUM}"
}

tearDown
add2txt
printOneNum
printTable
countWord
