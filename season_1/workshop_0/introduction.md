##大纲
 * DevOps基础
   * DevOps是什么
   * DevOps解决什么问题
   * DevOps都做什么
 * Vagrant基础
   * init
   * box管理
   * up
   * ssh
   * reload
   * destroy
   * port forward
   * multi-machines
   

##目标
  * 基本理解DevOps以及DevOps要做的事情
  * 可以使用Vagrant创建虚拟机并使用虚拟机工作
  


##详细内容

#### DevOps是啥？
```
DevOps顾名思义， 就是Developer + Operatior，开发 + 运维。 
当然，其实这里面还得加上QA。如图所示，三不像。
难道DevOps仅仅就是干三个角色的事儿么？
必然不是
DevOps是互相紧扣的一个过程。
通过Dev看QA，通过Ops看Dev等等
以上的概念太大，说个例子：
现在BOSS要你把所有javaEE的API拆成单独的jar包或者war包
然后每个包都部署到一个或者多个机器上。
真的你会去启动N个机器手动去部署么？
QA怎么去验证各个java实例的运行？
开发以后还怎么开发？

DevOps就会cover到上面的事儿
比如引入gradle自动拆成api包，然后要引入一个CI工具，比如jenkins或者go
当然构建出artifact是远远不够的，引入CD，我们要通过一系列的脚本来达到快速部署
还有在这个PIPELINE上的QA流程，是否通过job
最后，还能把虚拟化引入，比如vagrant、docker来部署单个java进程。

以上cover的就是devops的事儿
```

#### DevOps都干些啥？
```
如图，这些工具DevOps或多或少都会用
当然，我们普遍在LINUX下玩这件事儿，所以中间的BASH和SHELL SCRIPT是必须要求的
这里可以看到
有各种语言平台
有各种配置管理
有各种CI工具
有各种虚拟化产品

这些都会穿插在我们整个开发周期，所以，DevOps会一直跟这些工具打交到
```

#### DevOps解决什么问题
```
在提DevOps定义的时候举了一个例子，
实际上，DevOps就是解决整个开发过程中的协调问题
如何快速的给DEV和QA配置环境，开发的产出如何快速的到QA手里
QA反馈如何能及时到Dev手上
最重要的：CD
仅修改一行代码，要多久才能部署到产品环境，个人认为这就是DevOps。

```

#### SESSION课程和范围
```
一共会有5节课，这次是ITERATOR 0
目标是做一套完整的PIPELINE，达到快速部署的目的
会涉及到 java、jenkins、vagrant、tomcat、git等软件
通过是MAC作为宿主机，LINUX作为虚拟机进行整个课程的练习
```
