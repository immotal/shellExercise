### 题目要求

这个练习我们想讨论下 ssh 的应用场景，并根据对应的场景，对应的训练

1. vultr 上新购买的虚拟主机会提供用户名，IP 地址密码等信息，我们需要的是生成对应的 rsa 公钥和私钥，然后，将登陆信息如下，追加到
"${HOME}"/.ssh/config 文件中区, host的名字和对应的 key 的名字需要按照某种逻辑配置

``` 
Host aliyun
   User root
   HostName xx.xx.xx.xx
   IdentityFile ~/.ssh/alikey.pem
```

2. 有时候我们从阿里云和腾讯云获取的虚拟主机是没有密码的，只有用户名 IP 和给出的秘钥，我们这个时候的使用场景是
将给定的秘钥文件放到.ssh 目录下修改权限，或者将秘钥的内容放到.ssh 的新建文件内，然后追加 host 信息到 config 文件内

``` 
Host aliyun
   User root
   HostName xx.xx.xx.xx
   IdentityFile ~/.ssh/alikey.pem
```

3. 我们进行普通的服务开发时，需要简单部署一些服务，此时我们又不想使用比较中的 ansible 等服务登录远程机器操作
我们如何使用 shellScript 对远程主机进行操作，（假定已经有对应的秘钥了）, 操作过程如下
- 打包本地文件，SCP 到对应的远程机器地址
- 重启 NGINX 等服务或者 supervisorctl 等服务


[eof的用法](https://blog.csdn.net/zongshi1992/article/details/71693045)