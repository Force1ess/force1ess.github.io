---
title: "一些每个python程序员都该知道的事实"
date: 2024-01-14T23:09:24+08:00
draft: false
featured_image: "/assets/mulberry_full.jpg"
tags: ["技术"]
---


1. 在[PEP0703](https://peps.python.org/pep-0703/)通过前，不要期待进程之间能够高效的传输数据或者使用多线程来使用多核能力
2. 1的例外是，你共享的数据是定长的数据结构，那你可以使用shared_memory
3. 在Python 进程间大量传输数据会造成大量开销，尤其是当你使用`multiprocessing.Queue`
4. Jupyter在运行并行或异步等操作时，已经得到了很好的支持。例如accelerate的notebook launcher或者await
5. Python是按照共享对象传递，这句话的意思是，当你赋值或使用单进程的函数传递参数时
   1. 对于一个不可变对象- 例如元组、字符串，在改变的时候你创建了了一个新对象
   2. 对于一个可变对象-例如列表、类实例，你是在原对象的基础上进行操作

6. 当你遇到了很难解决的工程性性能问题时，例如：

   1. 想要在多个进程之间共享对象
   2. 想要减少内存开销

   也许你需要的是换一种语言，比如rust

7. 你应该准备本地文件大小10倍的内存来读取这个文件

8. 永远不要期待gc 语言会释放已经占用的内存

   >  例外: [使用*max_tasks_per_child释放子进程内存*](https://docs.python.org/zh-cn/3/library/concurrent.futures.html#concurrent.futures.ProcessPoolExecutor:~:text=%E5%9C%A8%203.11%20%E7%89%88%E6%9B%B4%E6%94%B9%3A%20%E5%A2%9E%E5%8A%A0%E4%BA%86%20max_tasks_per_child%20%E5%8F%82%E6%95%B0%E4%BB%A5%E5%85%81%E8%AE%B8%E7%94%A8%E6%88%B7%E6%8E%A7%E5%88%B6%E8%BF%9B%E7%A8%8B%E6%B1%A0%E4%B8%AD%E5%B7%A5%E4%BD%9C%E8%BF%9B%E7%A8%8B%E7%9A%84%E7%94%9F%E5%91%BD%E6%9C%9F%E3%80%82)

9. 不要给只写一次的IO对象加上buffer

10. 什么是惰性求值：简单来说就是，不在表达式处立即计算或阻塞，而是在之后用到再阻塞，例如：

    1. value = f() 没有阻塞

       print(value) 阻塞

11. 比起CPU性能、IO可能更需要考虑，尤其是随机读写机械硬盘的时候

12. 一些有意思的库：

    1. smart-open，自动为文件选择适合的open方法 ( gzip等)
    2. func_parse，根据函数签名为你生成命令行parser
