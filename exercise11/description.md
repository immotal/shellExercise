### 题目要求
在文本文档 1.txt第5行, 判断是否大于 5 行, 如果大于 5 行，在5行后面增加3.txt的内容(去除里面的空行), 如果没有 5 行，放到最后：
然后把 这个文本文档中只有一个数字的行给打印出来, 
根据用户输入的 index 对应的一位的数字，作为参数，最终打印出一个正方形 ■。
(如果这行是数字并且位数大于 3 行，然后按千分位输出。   比如输入数字串为“123456789”，输出为123,456,789。暂时不做了)
将文件内所有的单词的重复次数计算出来，只需要列出重复次数最多的5个单词。

最后记得回复现场，如果对应目录没有内容，需要我们自己添加上
1.txt
```txt
just test this file
1234
2
------
soooooooooooooooo
8
7
lalalaldemaxiya
111111111111111
22222222222222
333333333333333
44444444444444
```
2.txt
```txt
When you are old and grey and full of sleep,

And nodding by the fire, take down this book,

And slowly read, and dream of the soft look

Your eyes had once, and of their shadows deep;

How many loved your moments of glad grace,

And loved your beauty with love false or true,

But one man loved the pilgrim Soul in you,

And loved the sorrows of your changing face;

And bending down beside the glowing bars,

Murmur, a little sadly, how Love fled

And paced upon the mountains overhead

And hid his face amid a crowd of stars.
```

### 核心要点

### 涉及知识

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

### 容易被坑的点

- 使用 `wc -l` 注意返回的值不是单纯的数字，而是一个含有多个内容的字符串，需要用 AWK 重新组织一下
- 上一种情况是直接 wc -l filename 时出现的，如果使用管道符号 cat filename | wc -l 则不会出现以上情况，但是也有空格，需要 AWK 组织
- 只要出现 wc，一定记得用 AWK
- 输出单个单词的循环中 `for word in ${line}` 其中 `${line}` 不能加 ""，切记, 原因待查