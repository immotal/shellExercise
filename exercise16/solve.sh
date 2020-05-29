#!/bin/bash

# 采用了一个比较笨的办法来处理下面的形式
# 空格数字空格命令(命令中也有大量空格)
# 需要从这种结构中获得命令
# 但是这个命令这么写不是生效的，直接运行在 shell里 生效
# todo 查明为什么在 shell 脚本中不生效
history | sed 's/\ /)))/' | sed 's/\ />>>>/' | awk -F ">>>>" '{print $2}' | sort | uniq -c | sort -nr | sed -n '1, 10 p'