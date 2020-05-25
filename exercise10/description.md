### 题目要求
写个shell，看看你的Linux系统中是否有自定义用户（普通用户），若是有，一共有几个？

### 核心要点

- /etc/passwd 文件中的每个账号的含义

### 思路

根据 /etc/passwd 里账号的信息，以冒号分割的第三位是代表 UID，根据 UID 的大小判断是否为普通可登录用户

### /etc/passwd 解析

root:x:0:0:root:/root:/bin/bash  以:分割，共有七段
分别是

- root 账户名称
- x 指的是密码，现在都已放入 /etc/shadow 进行配置
- 0 UID， 0 号只的是管理员，1-999 指的是系统账户，1000+指的是普通可登录账户
- 0 GID
- root 账户的描述信息
- /root 账户的 home directory
- /bin/bash 账户的登录后的 shell
