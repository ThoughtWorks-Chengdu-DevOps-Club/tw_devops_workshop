Part2 Shell
===========

### Shell Vs Shell Script

* Shell 接收来自用户的指令，并与Kernel打交道
* Shell Script是针对shell编写的脚本

### Shell的变量

#### 环境变量

| 变量| 描述           |
| ---| ------------- |
| $n | $1表示第一个参数，$2表示第二个参数  |   
| $# | 命令行参数个数    |
| $0 | 当前程序名称      |
| $? | 前一个程序的返回码|
| $* | 以“参数1 参数2” 形式保存参数|
| $@ | 以“参数1”“残数”形式保存参数|
| $$ | 本程序的进程号|
| $! | 上一个命令的pid|

__example 01__

```
#! /bin/bash

echo "the number paramter is $#"
echo "the return code of last command $?"
echo "the script name is $0"
echo "the paramters is $*"
echo "\$1=$1 \$2=$2"
```

__example 02__

```
#! /bin/bash
if [ $# -ne 2 ]; then
	echo "Usage $0 string file";
	exit 1;

fi 
grep $1 $2

if [ $? -ne 0 ]; then
	echo "Not found $1 in $2"
	exit 1;

fi 
echo "Found $1 in $2"

```

#### 用户自定义变量

#### 变量的显示与设置

> 用户定义变量必须由字母数字以及下划线组成，切第一个字符不能为数字

```
name=yunlong
echo $name
echo "hello ${name}"
```

> 为避免混淆，常常使用${name}形式

```
#! /bin/bash

echo "\$a = $a"
# readonly a=2
a = 2
echo "\$a = $a"
unset a
echo "\$a = $a"
```

### 变量的有效范围

环境变量可以被子进程使用，自定义变量则不会存在与子进程当中

* 如果希望设置的变量其他shell都能用 export
* 如果希望设置的变量在登录linux时有效，则设置到.bash_profile文件

> export 注意，通常来说每个shell都是由某个shell（父shell）派生而来的，子shell中定义的变量只在子shell范围内有效

#### 变量的读取，数组与申明

```
#! /bin/bash
name=("Tom" "Tomy" "Jena")

for i in 0 1 2
do
	echo "$i : ${name[i]}"
done
```

```
NAME=yunlong
export NAME
env
```

### 数据流从定向

* 什么是数据流从定向

| 命令    | 说明 |
|--------|---------------------------------------------|
| >      | 以覆盖方式将标准输出（stdout）输出到指定的文件      |
| >>     | 以追加的方式将标准输出（stdout）输出到指定的文件     |
| 2>     | 以覆盖的方式将标准错误输出（stderr）输出到指定文件   |
| 2>>    | 以追加方式将标准错误输出（stderr）输出到指定文件     |


* 命令执行的判断依据 ;,&&, ||

| 命令                | 说明                                                                                   | 
|--------------------|---------------------------------------------------------------------------------------|
| ```cmd1;cmd2```    | cmd1执行完成后顺序执行cmd2的指令                                                           |
| ```cmd1 && cmd2``` |  如果cmd1执行完成且正确执行($?=0) 则接着执行cmd2; 如果cmd1执行完成且发生了错误($?!=0),则不执行cmd2 |
| ```cmd2 || cmd2``` |  如果cmd1执行完成且正确执行，则不执行cmd2; 如果cmd1执行完成且发生了错误，则执行cmd2                |

### 管道与命令替换

#### 管道命令

> linux中管道命令操作符是："|",它是指前一个命令的输出作为后一个命令的输入，也就是standard output 的信息，对于stdandard 
error 信息没有直接处理能力。然后，传递给下一个命令，作为标准的输入 standard input. 

```
* 管道命令只处理前一个命令正确输出，不处理错误输出; 
* 管道命令右边命令，必须是能够接收标准输入流命令;
```

单个管道：

```
ps -ef|grep java
```

多个管道：

```
ps -ef | grep Google | wc -l
```

#### 命令替换

> 在Linux命令行模式下，当遇到一对“`” (上分割符)时，将首先执行“`”中间包含的命令，然后将其输出结果作为参数代入命令行中.

```
touch `date +%Y%m%d%k%M%S`.txt
```

该命令将会优先执行"`"之间的命令，它将按照指定格式输出当前时间，并作为参数传递个touch命令。即可创建一个包含当前时间的文本文件


```
man ls | col -b > ls.man.txt
```

```
kill -9 `ps -ef | grep smbd | tr -s ' ' | awk -F' ' '{print $2}'`
```

```
history | grep git
```

```
cat .bash_history | awk '{print $1}' | sort | uniq -c | sort -nr | head -10
```

### 其他常用的命令：

* 选取命令：cut, grep
* 排序命令：sort, wc, uniq

### 其他

#### 命令别名设置

设置别名

```
alias
```

取消别名

```
unalias
```

#### 历史命令

显示历史命令

```
history
```

执行历史命令

* ```!66``` 执行第66条命令
* ```!!``` 执行上一条命令
* ```!al``` 罪行最近以al开头的命令


查询历史命令

```
ctrl + r
```

### 一些常用的命令

| 命令     | 说明  | 语法|
|---------|------|----|
| grep    |      |    |
| sort    |||  
| wc      |||
| uniq    |||
