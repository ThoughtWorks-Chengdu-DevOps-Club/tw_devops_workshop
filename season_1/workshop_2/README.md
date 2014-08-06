
Workshop_2
==========

## 目标
> 目标：了解执行 Ansible 的方法，并能够读懂简单 Ansible PlayBook。<br>
> 熟悉在 Jenkins 建立 Task，添加 Slave Machine，安装插件等操作。

## Ansible
#### >> 安装
```
sudo apt-get install python-pip
sudo pip install ansible
```

#### >> 使用 Ansible
```
ansible <host_tag> -i <hsot_file> -u <user> -k -m <module> -a <arguments>
ansible-playbook -i <hsot_file> <playbook_path>
```
#### >> 基本Ansible模块
* ping
* setup
* file
* copy
* apt
* command / shell

#### >> 其他主题
* vars，vars_file 和 vars_prompt 使用变量
* when 条件语句
* with_items 循环语句
* include 

## Jenkins 
#### >> 使用内网和国内 APT 源
执行以下命令替换 /etc/apt/sources.list 文件原有内容

```
sudo chmod go+w /etc/apt/sources.list

sudo cat > /etc/apt/sources.list << ENDOFLIST
deb http://10.17.7.20/debs/trusty ./
deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
ENDOFLIST
```

执行以下命令更新本地的软件包列表

```
sudo apt-get clean
sudo apt-get update
```

#### >> 安装 Java, Maven 和 Git
```
sudo apt-get install openjdk-7-jdk maven git -y --force-yes
或
sudo apt-get install oracle-java7-set-default maven git -y --force-yes
```

#### >> 启动 Jenkins 服务
下载 Jenkins

```
wget http://10.17.7.20/jenkins/jenkins.war
```
启动 Jenkins 服务

```
java -jar jenkins.war --httpPort=8080
```

#### >> 创建 Update source code job
* New Item -> Build a free-style software project

#### >> 安装 Git 插件

Manage Jenkins -> Manage Plugins -> Available<br>
Filter: __Git Plugin__

插件信息

```
https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin
```
快速安装

```
wget http://10.17.7.20/jenkins/Git.tar.gz
tar zxf Git.tar.gz -C ~/.jenkins/plugins/
```
#### >> 自动更新代码

Poll SCM

```
H*/1 * * * *
```

#### >> 安装 Clone Workspace SCM 插件

Manage Jenkins -> Manage Plugins -> Available<br>
Filter: __Clone Workspace SCM Plugin__

插件信息

```
https://wiki.jenkins-ci.org/display/JENKINS/Clone+Workspace+SCM+Plugin
```
快速安装

```
wget http://10.17.7.20/jenkins/Clone_Workspace_Scm.tar.gz
tar zxf Clone_Workspace_SCM.tar.gz -C ~/.jenkins/plugins/
```

#### >> 创建 Compile job
* New Item -> Build a maven project

#### >> 配置编译工具路径

* Manage Jenkins -> Configure System -> JDK: /usr/lib/jvm/java-7-oracle
* Manage Jenkins -> Configure System -> maven: /usr/share/maven

#### >> 创建 Thief job
```
if [ -r ${HOME}/.ssh/thief_rsa ]; then
	touch /dev/null
else
	ssh-keygen -t rsa -f ${HOME}/.ssh/thief_rsa -N ''
fi

echo "Private key:"
cat ${HOME}/.ssh/thief_rsa
echo "Public key:"
cat ${HOME}/.ssh/thief_rsa.pub
```

#### >> 用户管理
* Manage Jenkins -> Configure Global Security -> Authorization

* 使用 [Role & Strategy Plugin](http://wiki.hudson-ci.org/display/HUDSON/Role+Strategy+Plugin) 简化用户管理

#### >> 添加 Slave Machine
* 修改 Vagrantfile 添加一个 private ip

```
config.vm.hostname = "master"
config.vm.network "private_network", ip: "10.1.2.15"
```
执行 `vagrant reload`

* 新建一个目录

然后执行 `vagrant init ubuntu1404` 新建一个虚拟机，然后修改 Vagrantfile

```
config.vm.hostname = "slave"
config.vm.network "private_network", ip: "10.1.2.16"
```
执行 `vagrant up`

* Manage Jenkins -> Manage Nodes -> New Node

#### >> 安装 Build Pipeline 插件

Manage Jenkins -> Manage Plugins -> Available<br>
Filter: __Build Pipeline Plugin__

插件信息

```
https://wiki.jenkins-ci.org/display/JENKINS/Build+Pipeline+Plugin
```
快速安装

```
wget http://10.17.7.20/jenkins/Build_Pipeline.tar.gz
tar zxf Build_Pipeline.tar.gz -C ~/.jenkins/plugins/
```

#### >> 创建 Pipeline
Create view -> Build Pipeline View

#### >> 实用 Plugin
* [Role & Strategy](http://wiki.jenkins-ci.org/display/HUDSON/Role+Strategy+Plugin)
* [Deploy](http://wiki.jenkins-ci.org/display/HUDSON/Deploy+Plugin)
* [CheckStyle](http://wiki.jenkins-ci.org/display/HUDSON/Checkstyle+Plugin)
* [Build User Vars](https://wiki.jenkins-ci.org/display/JENKINS/Build+User+Vars+Plugin)
* [Text-finder](https://wiki.jenkins-ci.org/display/JENKINS/Text-finder+Plugin)