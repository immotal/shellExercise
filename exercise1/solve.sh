#!/bin/bash
# 使用 for 循环，拿出每一个进程的内存信息，然后加和

sum=0
for i in $(ps aux | awk '{print $6}'); do
  sum=$(($sum+$i))
done
echo ${sum}