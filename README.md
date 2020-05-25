# shellExercise100
shell 练习题，快速掌握平时常用的 shell 技巧

### [exercise1](https://github.com/immotal/shellExercise100/tree/master/exercise1)
#### main
- ps命令用法
- for循环
- 加法运算
#### tips
- 如果获得一个进程的进程号
- xargs 的使用， 用于将标准输出变为管道符号后命令的标准输入，因为有些 cmd 只支持标准输入
- 利用上两步杀死进程 kill -9 pidnum

### [exercise2](https://github.com/immotal/shellExercise100/tree/master/exercise2)
#### main
- 条件判断, 字符串判断，整数判断
- sed 用法
- awk 用法 `awk 参数(一般用于修改分隔符) '条件和动作' 标准输入`  `awk -F ":" '{print $NF}' file.name`
- 函数，带返回值的函数, 使用 $? 获取函数的返回值
- ping 的用法

### [exercise3](https://github.com/immotal/shellExercise100/tree/master/exercise3)
#### main
- find 用法 `find 路径 参数 条件` `find . -type f -name "*.md"`
- awk 用法
- read 等的用法

### [exercise4](https://github.com/immotal/shellExercise100/tree/master/exercise4)
#### main
- date 的用法

### [exercise5](https://github.com/immotal/shellExercise100/tree/master/exercise5)
#### main
- awk 
- sort
- uniq -c 的用法，统计重复数量

### [exercise6](https://github.com/immotal/shellExercise100/tree/master/exercise6)
#### main
- sed 的用法 `sed 参数 '范围 动作' 标准输入`

### [exercise7](https://github.com/immotal/shellExercise100/tree/master/exercise7)
#### main
- awk length 用法  `awk '{print length($0)}' <<< "$var"`
- for 循环取字符串中的单词

### [exercise8](https://github.com/immotal/shellExercise100/tree/master/exercise8)
#### main
- case 用法
- 函数返回值
- sed 简单用法

### [exercise9](https://github.com/immotal/shellExercise100/tree/master/exercise9)
#### main
- sed 用法
- awk 用法
- iptables 用法, 暂时未补充

### [exercise10](https://github.com/immotal/shellExercise100/tree/master/exercise10)
#### main
- linux 账号管理
- awk 用法
- 函数返回值问题
