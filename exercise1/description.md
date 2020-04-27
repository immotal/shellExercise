### 题目要求
写一个脚本计算一下linux系统所有进程占用内存大小的和。

### 核心要点
- ps命令用法
- for循环
- 加法运算

### 参考资料和命令解析
ps aux 输出如下的 header
```
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
```
 分别代表的含义是:
 
 USER：该 process 属于那个使用者账号的
 
 PID ：该 process 的号码
 
 %CPU：该 process 使用掉的 CPU 资源百分比
 
 %MEM：该 process 所占用的物理内存百分比
 
 VSZ ：该 process 使用掉的虚拟内存量 (Kbytes)
 
 RSS ：该 process 占用的固定的内存量 (Kbytes)
 
 TTY ：该 process 是在那个终端机上面运作，若与终端机无关，则显示 ?，另外， tty1-tty6 是本机上面的登入者程序，若为 pts/0 等等的，则表示为由网络连接进主机的程序。
 
 STAT：该程序目前的状态，主要的状态有
 
 R ：该程序目前正在运作，或者是可被运作
 
 S ：该程序目前正在睡眠当中 (可说是 idle 状态)，但可被某些讯号 (signal) 唤醒。
 
 T ：该程序目前正在侦测或者是停止了
 
 Z ：该程序应该已经终止，但是其父程序却无法正常的终止他，造成 zombie (疆尸) 程序的状态
 
 START：该 process 被触发启动的时间
 
 TIME ：该 process 实际使用 CPU 运作的时间
 
 COMMAND：该程序的实际指令