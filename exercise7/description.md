### 题目要求
用shell打印下面这句话中字母数小于6的单词, 并计算所有的单词个数。 
```
Bash also interprets a number of multi-character options.
```

### 核心要点
- for循环遍历所有单词, 需要注意, 不能使用引号
- wc -c获取字符串长度
- awk 的 length 获取长度

### 小例子

- `echo string | awk '{print length($0)}'` 会算出 string 字符的长度

### tips

- [Shell脚本中计算字符串长度的几种方法](https://www.jb51.net/article/51348.htm)