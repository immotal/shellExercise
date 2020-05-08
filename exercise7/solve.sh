#!/bin/bash

sentence="Bash also interprets a number of multi-character options."

# 首先使用 sed 替换非单词部分, 拿到句子中单词的个数
newSentence=$(sed 's/[.-]//g' <<< "$sentence")
echo "$newSentence"
# NOTICE 我们平时使用一般都是用 $NF 拿到分隔符分隔后最后一个元素，其中 NF 表示的就是最后一个元素的位置编号
l=$(awk '{print NF}' <<< "$newSentence")
echo "$l"
# 其实只需要下面的方式就可以拿到要求的数据
for word in $sentence; do
  wordLen=$(awk '{print length($0)}' <<< "$word")
  if [ "$wordLen" -lt 6 ]; then
    echo "$word"
  fi
done