# shellExercise100
shell 练习题，快速掌握平时常用的 shell 技巧

<!--ts-->
   * [shellExercise100](#shellexercise100)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise1">计算一下linux系统所有进程占用内存大小的和</a>](#计算一下linux系统所有进程占用内存大小的和)
            * [main](#main)
            * [tips](#tips)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise2">监控远程的一台机器的存活状态，当发现宕机时发一封邮件给你自己</a>](#监控远程的一台机器的存活状态当发现宕机时发一封邮件给你自己)
            * [main](#main-1)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise3">批量查找修改压缩文件</a>](#批量查找修改压缩文件)
            * [main](#main-2)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise4">把磁盘的使用情况写到日期为文件名字的文件中</a>](#把磁盘的使用情况写到日期为文件名字的文件中)
            * [main](#main-3)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise5">统计出日志文件中每个IP访问量有多少</a>](#统计出日志文件中每个ip访问量有多少)
            * [main](#main-4)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise6"> 使用 sed 处理日志文件，筛选对应内容</a>](#-使用-sed-处理日志文件筛选对应内容)
            * [main](#main-5)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise7">打印 提供的这句话中字母数小于6的单词</a>](#打印-提供的这句话中字母数小于6的单词)
            * [main](#main-6)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise8">输入自定义命令然后运行对应的一个命令</a>](#输入自定义命令然后运行对应的一个命令)
            * [main](#main-7)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise9">根据访问日志处理请求量过高的 IP</a>](#根据访问日志处理请求量过高的-ip)
            * [main](#main-8)
         * [<a href="https://github.com/immotal/shellExercise100/tree/master/exercise10">查看 Linux 系统中的普通用户的数量</a>](#查看-linux-系统中的普通用户的数量)
            * [main](#main-9)

<!-- Added by: fupeng.li, at: Wed May 27 20:46:06 CST 2020 -->

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

### [监控远程的一台机器的存活状态，当发现宕机时发一封邮件给你自己](https://github.com/immotal/shellExercise100/tree/master/exercise2)
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

### [ 使用 sed 处理日志文件，筛选对应内容](https://github.com/immotal/shellExercise100/tree/master/exercise6)
#### main
- sed 的用法 `sed 参数 '范围 动作' 标准输入`

### [打印 提供的这句话中字母数小于6的单词](https://github.com/immotal/shellExercise100/tree/master/exercise7)
#### main
- awk length 用法  `awk '{print length($0)}' <<< "$var"`
- for 循环取字符串中的单词

### [输入自定义命令然后运行对应的一个命令](https://github.com/immotal/shellExercise100/tree/master/exercise8)
#### main
- case 用法
- 函数返回值
- sed 简单用法

### [根据访问日志处理请求量过高的 IP](https://github.com/immotal/shellExercise100/tree/master/exercise9)
#### main
- sed 用法
- awk 用法
- iptables 用法, 暂时未补充

### [查看 Linux 系统中的普通用户的数量](https://github.com/immotal/shellExercise100/tree/master/exercise10)
#### main
- linux 账号管理
- awk 用法
- 函数返回值问题
