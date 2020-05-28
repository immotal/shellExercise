# shellExercise100
shell 练习题，快速掌握平时常用的 shell 技巧

<!--ts-->
* [计算一下linux系统所有进程占用内存大小的和](#计算一下linux系统所有进程占用内存大小的和)
* [监控远程的一台机器的存活状态宕机时发一封邮件给你自己](#监控远程的一台机器的存活状态宕机时发一封邮件给你自己)
* [批量查找修改压缩文件](#批量查找修改压缩文件)
* [把磁盘的使用情况写到日期为文件名字的文件中](#把磁盘的使用情况写到日期为文件名字的文件中)
* [统计出日志文件中每个IP访问量有多少](#统计出日志文件中每个IP访问量有多少)
* [使用sed处理日志文件筛选对应内容](#使用sed处理日志文件筛选对应内容)
* [打印提供的这句话中字母数小于6的单词](#打印提供的这句话中字母数小于6的单词)
* [输入自定义命令然后运行对应的一个命令](#输入自定义命令然后运行对应的一个命令)
* [根据访问日志处理请求量过高的IP](#根据访问日志处理请求量过高的IP)
* [查看Linux系统中的普通用户的数量](#查看Linux系统中的普通用户的数量)
* [awk和sed等工具混合使用综合](#awk和sed等工具混合使用综合)
<!--te-->


### [计算一下linux系统所有进程占用内存大小的和](https://github.com/immotal/shellExercise100/tree/master/exercise1)

#### main
- ps命令用法
- for循环
- 加法运算

#### tips
- 如果获得一个进程的进程号
- xargs 的使用， 用于将标准输出变为管道符号后命令的标准输入，因为有些 cmd 只支持标准输入
- 利用上两步杀死进程 kill -9 pidnum

### [监控远程的一台机器的存活状态宕机时发一封邮件给你自己](https://github.com/immotal/shellExercise100/tree/master/exercise2)

#### main
- 条件判断, 字符串判断，整数判断
- sed 用法
- awk 用法 `awk 参数(一般用于修改分隔符) '条件和动作' 标准输入`  `awk -F ":" '{print $NF}' file.name`
- 函数，带返回值的函数, 使用 $? 获取函数的返回值
- ping 的用法

### [批量查找修改压缩文件](https://github.com/immotal/shellExercise100/tree/master/exercise3)
#### main
- find 用法 `find 路径 参数 条件` `find . -type f -name "*.md"`
- awk 用法
- read 等的用法

### [把磁盘的使用情况写到日期为文件名字的文件中](https://github.com/immotal/shellExercise100/tree/master/exercise4)
#### main
- date 的用法

### [统计出日志文件中每个IP访问量有多少](https://github.com/immotal/shellExercise100/tree/master/exercise5)
#### main
- awk 
- sort
- uniq -c 的用法，统计重复数量

### [使用sed处理日志文件筛选对应内容](https://github.com/immotal/shellExercise100/tree/master/exercise6)
#### main
- sed 的用法 `sed 参数 '范围 动作' 标准输入`

### [打印提供的这句话中字母数小于6的单词](https://github.com/immotal/shellExercise100/tree/master/exercise7)
#### main
- awk length 用法  `awk '{print length($0)}' <<< "$var"`
- for 循环取字符串中的单词

### [输入自定义命令然后运行对应的一个命令](https://github.com/immotal/shellExercise100/tree/master/exercise8)
#### main
- case 用法
- 函数返回值
- sed 简单用法

### [根据访问日志处理请求量过高的IP](https://github.com/immotal/shellExercise100/tree/master/exercise9)
#### main
- sed 用法
- awk 用法
- iptables 用法, 暂时未补充

### [查看Linux系统中的普通用户的数量](https://github.com/immotal/shellExercise100/tree/master/exercise10)
#### main
- linux 账号管理
- awk 用法
- 函数返回值问题

### [awk和sed等工具混合使用综合](https://github.com/immotal/shellExercise100/tree/master/exercise11)
#### main
- linux 账号管理
- awk 用法
- 函数返回值问题
- read
- for 循环的嵌套
- sed {} 的作用，花括号内;的作用，r file 的用法
- uniq, sort 的使用
- wc 使用，特别注意事项，出现 wc 必须跟 awk
- if 条件中 字符串和数字的比较多看下，容易忘
- 循环输出一个文件内的所有单词
- seq 的使用
- 综合判断 [ ] && [ ] 中 && 的使用
- while 和 read 还有 < file 的使用
- while 中 continue 和 break 的使用
