### 题目要求
有日志 log，部分内容如下

```log
112.111.12.248 – [25/Sep/2020:16:08:31 +0800]www.baidu.com '/seccode.php?update=0.5593110133088248' 200'http://www.baidu.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)'
61.147.76.51 – [25/Sep/2020:16:08:31 +0800]www.google.com '/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71' 301'http://www.google.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
112.111.12.246 – [25/Sep/2020:16:08:31 +0800]www.baidu.com '/seccode.php?update=0.5593110133088248' 200'http://www.baidu.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)'
61.147.76.52 – [25/Sep/2020:16:08:31 +0800]www.google.com '/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71' 301'http://www.google.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
61.147.77.51 – [25/Sep/2020:16:08:31 +0800]www.google.com '/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71' 301'http://www.google.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
112.111.13.246 – [25/Sep/2020:16:08:31 +0800]www.baidu.com '/seccode.php?update=0.5593110133088248' 200'http://www.baidu.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)'
112.111.12.246 – [25/Sep/2020:16:08:31 +0800]www.baidu.com '/seccode.php?update=0.5593110133088248' 200'http://www.baidu.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)'
61.147.76.52 – [25/Sep/2020:16:08:31 +0800]www.google.com '/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71' 301'http://www.google.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
61.147.76.51 – [25/Sep/2020:16:08:31 +0800]www.google.com '/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71' 301'http://www.google.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
112.111.12.246 – [25/Sep/2020:16:08:31 +0800]www.baidu.com '/seccode.php?update=0.5593110133088248' 200'http://www.baidu.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)'
61.147.76.52 – [25/Sep/2020:16:08:31 +0800]www.google.com '/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71' 301'http://www.google.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
61.147.77.51 – [25/Sep/2020:16:08:31 +0800]www.google.com '/attachment.php?aid=4554&k=9ce51e2c376bc861603c7689d97c04a1&t=1334564048&fid=9&sid=zgohwYoLZq2qPW233ZIRsJiUeu22XqE8f49jY9mouRSoE71' 301'http://www.google.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'
112.111.13.246 – [25/Sep/2020:16:08:31 +0800]www.baidu.com '/seccode.php?update=0.5593110133088248' 200'http://www.baidu.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)'
112.111.12.246 – [25/Sep/2020:16:08:31 +0800]www.baidu.com '/seccode.php?update=0.5593110133088248' 200'http://www.baidu.com' 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;)'
```

统计出每个IP访问量有多少

### 实现逻辑

首先使用 AWK 拿到对应的 IP 数据 `awk '{print $1}'`

将对应的数据首先排序，将重复的 IP 数据都放到相邻的位置，因为 uniq 处理的是相邻的重复项

uniq 中 -c 参数用于统计相邻重复项的数量（--count）

最后将其再次排序，得到需要的结果即可

### 核心要点
- awk
- sort
- uniq

### tips

- awk 的用法见阮老师的博客
- sort 的用法 (常用参数 -r 等, 翻转排序等)
- uniq 的用法(常用参数 -c 统计重复数量)
- [sort, uniq 用法](https://liam.page/2016/05/05/best-match-using-sort-and-uniq-to-do-set-operations/)
