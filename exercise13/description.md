### 题目要求

经过前面那么多 shellScript 的练习，相信我们已经积累了不少经验了，这一节我们着重于复习脚本的一些基本语法
加深基本语法的印象，刻意练习增加熟练程度

写一个猜数字脚本，当用户输入的数字和预设数字（随机生成一个0-100的数字）一样时，直接退出，否则让用户一直输入，并且提示用户的数字比预设数字大或者小。

### 涉及知识

- "${RANDOM}" 的使用
- 数字的计算
- sed 的具体工作模式

### 容易犯错的点

- ["${RANDOM}"](http://tldp.org/LDP/abs/html/randomvar.html) 生成  0 - 32767 之间的随机数
- 数字的计算，$(()), 同时数字不能用""包围 
- 默认sed软件是对模式空间（内存中的数据）操作，而-i选项会更改磁盘上的文件内容。


有关 sed 的输出
> By default sed prints all processed input (except input that has been modified/deleted by commands such as d). Use -n to suppress output, and the p command to print specific lines. The following command prints only line 45 of the input file:

我解读下这个句子的意思，我们先把 p 这个命令抛开不谈
sed 命令如果在不使用 -i 的情况下，默认是在模式空间进行操作，
不会损害原文件，而操作后的输出结果是怎么的呢？是这样的：
如果这一行不需要处理（没有被行范围匹配到，或者这一行就算被处理
也没有发生什么变化）那么他会被直接输出（不论是屏幕还是
我们其他的输出文件），然后接着读取下一行，如果这一行需要处理，
那么会根据命令将处理完毕后的结果进行输出（除非使用了删除操作，
这一行会被直接跳过，连空行都不会输出；如果使用了替换等操作
导致了这一行成为了空行，此时这一行依然需要输出，输出为一个空行）。

存疑：是否是未被匹配到的行不进入模式空间，而直接进行输出

```
# 此段内容摘自官方教程：http://www.gnu.org/software/sed/manual/sed.html#Execution-Cycle
6.1 How sed Works
6.1 sed 如何工作
sed maintains two data buffers: the active pattern space, and the auxiliary hold space. Both are initially empty.

Sed 维护两个数据缓冲区: 活动模式空间和辅助保持空间。

sed operates by performing the following cycle on each line of input: first, sed reads one line from the input stream, removes any trailing newline, and places it in the pattern space. Then commands are executed; each command can have an address associated to it: addresses are a kind of condition code, and a command is only executed if the condition is verified before the command is to be executed.

Sed 通过对每一行输入执行以下循环操作: 首先，sed 从输入流中读取一行，删除任何尾随换行符，并将其放置到模式空间中。 然后执行命令; 每个命令可以有一个与之相关的地址: 地址是一种条件代码，只有在执行命令之前验证条件时才执行命令。

When the end of the script is reached, unless the -n option is in use, the contents of pattern space are printed out to the output stream, adding back the trailing newline if it was removed.8 Then the next cycle starts for the next input line.

当到达脚本的末尾时，除非使用-n 选项，否则模式空间的内容将被打印到输出流，如果删除了尾随换行符，则将其加回。8然后下一个周期开始下一个输入行。

Unless special commands (like ‘D’) are used, the pattern space is deleted between two cycles. The hold space, on the other hand, keeps its data between cycles (see commands ‘h’, ‘H’, ‘x’, ‘g’, ‘G’ to move data between both buffers).

除非使用特殊命令(如“ d”) ，否则模式空间将在两个循环之间被删除。 另一方面，保持空间在两个循环之间保持其数据(参见命令‘ h’、‘ h’、‘ x’、‘ g’、‘ g’在两个缓冲区之间移动数据)。
```

-n 参数的解读

> -n
>
> --quiet
> --silent
>
> By default, sed prints out the pattern space at the end of each cycle through the script (see How sed works). These options disable this automatic printing, and sed only produces output when explicitly told to via the p command.