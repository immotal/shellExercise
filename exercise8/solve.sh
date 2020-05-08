#!/bin/bash

judgeInput() {
  input=$1
  if [ -z "$input" ]; then
    echo "your input is null, i will exit"
    exit 1
  fi
  judge=$(sed 's/[0-9]//g' <<< "$input")
  if [ -z "$judge" ]; then
    echo "your input is number, please input a alphabeta"
    return 2
  fi
}

while true; do
  echo -n "please input the recommand cmd: "
  read cmd
  judgeInput "$cmd"
  res=$?
  if [ "$res" -eq 2 ]; then
    continue
  fi
  case "${cmd}" in
    d)
      date +%F ;;
    l)
      ls -la ;;
    w)
      whoami;;
    p)
      pwd;;
    exit)
      exit 0;;
    *)
      echo "没有匹配值，请重新输入";;
  esac
done
