### 题目要求
设计一个脚本，监控远程的一台机器(假设ip为114.114.114.114)的存活状态，当发现宕机时发一封邮件给你自己。

### 核心要点
ping -c5 114.114.114.114 通过ping来判定对方是否在线

发邮件脚本可用 echo "发邮件已成功" 来代替


### 步骤
首先执行监控命令 ping -c5 114.114.114.114

```
PING 114.114.114.114 (114.114.114.114): 56 data bytes
64 bytes from 114.114.114.114: icmp_seq=0 ttl=71 time=15.260 ms
64 bytes from 114.114.114.114: icmp_seq=1 ttl=60 time=12.756 ms
64 bytes from 114.114.114.114: icmp_seq=2 ttl=76 time=18.408 ms
64 bytes from 114.114.114.114: icmp_seq=3 ttl=68 time=14.087 ms
64 bytes from 114.114.114.114: icmp_seq=4 ttl=67 time=13.438 ms

--- 114.114.114.114 ping statistics ---
5 packets transmitted, 5 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 12.756/14.790/18.408/1.988 ms
```

然后拿到对应的连接失败的比例 awk -F '%' '{print $1}' | awk '{print $NF}'

判断拿到的比例是否为空

判断拿到的比例是否是数字

判断拿到的比例的大小

### 注意事项
- 函数的返回值，下一个命令可以用 $? 拿到返回值
- sed 中 -n 这个参数的含义是不输出模式空间内的内容，只输出匹配的内容

### 小 tips
- awk 的使用方式，见阮老师的文章 [awk 使用教程](http://www.ruanyifeng.com/blog/2018/11/awk.html)

- sed 的使用方式，[sed 使用技巧](https://juejin.im/post/5ce5190b5188252dbb08baa8)

- [耗子叔的 sed 简介](https://coolshell.cn/articles/9104.html)

简而言之：
- awk 是处理文本文件的一个应用程序， 它依次处理文件的每一行，并读取里面的每一个字段。对于日志、CSV 那样的每行格式相同的文本文件，awk可能是最方便的工具。
- sed 全名叫stream editor，流编辑器，用程序的方式来编辑文本, 它读取输入流(可以是文件、标准输入)的每一行放进模式空间(pattern space)，同时将此行行号通过sed行号计数器记录在内存中，然后对模式空间中的行进行模式匹配，如果能匹配上则使用sed程序内部的命令进行处理，处理结束后，从模式空间中输出(默认)出去，并清空模式空间，随后再从输入流中读取下一行到模式空间中进行相同的操作，直到输入流中的所有行都处理完成。

### 涉及的部分
- [函数](https://wangdoc.com/bash/function.html)
- [条件判断](https://wangdoc.com/bash/condition.html) (包含字符串，数字等判断)