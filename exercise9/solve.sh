#!/bin/bash

LOGPATH=/tmp/shellScriptExercise/log
now=$(date +%FT%H:%M)
ipList=/tmp/shellScriptExercise/ipList.txt

# 解读需求，首先检测异常 IP 是以分钟为维度的
# 检测正常 IP 是以半小时为维度的

# 拿到日志，首先观察日志里时间的格式，找到时间格式后，设置分钟维度的事件筛选
# 时间格式 2020-05-08T03:44
blockIp() {
  # 这里有个需要注意的是，awk 的条件判断的使用 '$1 > 20 {print $2}' 注意学习下
  # 这个时间这里写死了，应该注意不要写死，用实时的，因为日志文件固定了，所以这里为了演示写死了
  sed -n '/2020-05-08T03:44/p' $LOGPATH | awk '{print $NF}' | awk -F '"' '{print $1}'  | sort -n | uniq -c | sort -r | awk '$1 > 20 {print $2}' > ${ipList}
  ipNum=$(wc -l ${ipList} | awk '{print $1}')
  if [ ! -z "${ipNum}" ]; then
    # shellcheck disable=SC2013
    for ip in $(cat $ipList); do
      echo "$ip" # 这里可以替换为封 IP 的命令 iptables -I INPUT -s $ip -j REJECT
    done
  fi
}

# 解封 IP 的逻辑是拿到被封的 IP，然后去检查这些 IP 最近出现的频率，如果频率低了，就把这些 IP 解封
unblockIp() {
  # 具体的逻辑使用 iptables 命令，暂时搁置，待自习研究下
  echo "finish unblock ip"
}

main() {
  while true; do
  minute=$(awk -F ":" '{print $NF}' <<< "${now}")
  if [ "${minute}" -eq "00" ] || [ "${minute}" -eq "30" ]; then
    blockIp
    unblockIp
  else
      blockIp
  fi
  sleep 60
  done
}

main