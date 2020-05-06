### 题目要求
找到/myMd 目录下所有后缀名为.md的文件

批量修改.md 为 .md.bak

把所有.bak文件打包压缩为myMd.tar.gz

批量还原文件的名字，即把增加的.bak再删除

### 核心要点

- find用来查找所有.md 文件
- read 读取文件内容
- tar打包一堆文件
- 还原文件名用 for 循环

### tips

- find 的用法, 见阮老师的博客, [Linux的五个查找命令](http://www.ruanyifeng.com/blog/2009/10/5_ways_to_search_for_files_using_the_terminal.html)
- awk 的用法

### 注意事项
- cd 的用法，最后后面跟着 || 符号，以便于一旦 cd 失败，采取后一步操作
- find 的具体用法，见 tips
- [SC2115需要注意的事项](https://github.com/koalaman/shellcheck/wiki/SC2115), 主要是如何让参数不解析成`/*`
- 有些命令只能解析标砖输入，需要我们使用 `<<<` [将参数转为标准输入](https://wangdoc.com/bash/read.html)