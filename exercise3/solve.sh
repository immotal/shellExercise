#!/bin/bash

oldPath=$(pwd)
aimPath="/tmp/myMd"
oldFileList="$aimPath"/old.list
newFileList="$aimPath"/new.list

# 初始化数据
setUp() {
  # 如果存在需要的路径数据，先删除，再新建
  if [ -d $aimPath ]; then
    # shellcheck disable=SC2115
    # NOTICE 防止被转换成 `/*` 形式
    rm -rf "${aimPath:?}"/*
  else
    mkdir $aimPath
  fi
  cd /tmp/myMd || exit 1
  for i in {1..10}; do
    if [ ! -e "$i".md ]; then
      touch "$i".md
    fi
  done
  cd $oldPath || exit 1
  echo "now your current dir is $(pwd)"
}

# 找到所有的文件，批量修改，并记录原始文件和修改后的文件
findAndChangeFile() {
  echo "begin find file"
  # NOTICE find 的具体用法 `-type f` 表示只查找文件 `-name "*.md"` 表示查找名字后缀是 .md 的文件
  find $aimPath -type f -name "*.md" > $oldFileList
  cd $aimPath || exit 1
  # NOTICE 如果read 一个文件，逐行 read（更进一步，更改 IFS，使用新的分隔符读取文件内容）
  while read line; do
    mv "$line" "$line".bak
    local bakName
    # NOTICE 由于 AWK 只能接受标准输入，因此为了让参数也可以使用 AWK，必须将其转化为标准输入，使用 <<<
    # <<<是 Here 字符串，用于将变量值转为标准输入，因为read命令只能解析标准输入。同样 AWK 也只能解析标砖输入
    # https://wangdoc.com/bash/read.html
    bakName=$(awk -F '/' '{print $NF}' <<< "$line".bak)
    echo $bakName
    echo "$bakName" >> $newFileList
  done < $oldFileList
  echo "end find file"
}

# 打包压缩 bak 文件为 myMd.tar.gz
composeFile() {
  # shellcheck disable=SC2046
  # xargs 将 cat 的标准输出内容提供给右侧命令作为参数
  # xgars 单独使用等价于 xargs echo
  tar -cvzf "myMd.tar.gz" $(cat $newFileList | xargs echo)
}

# 将修改后的文件名还原回来
recoverFile() {
  while read line; do
    mv "$line".bak "$line"
  done < $oldFileList
  rm -f "$oldFileList"
  rm -f "$newFileList"
}


setUp
findAndChangeFile
composeFile
recoverFile