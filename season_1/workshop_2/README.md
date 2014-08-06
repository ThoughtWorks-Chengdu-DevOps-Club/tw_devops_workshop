
Workshop_3
==========

## 目标
> 目标：了解执行 Ansible 的方法，并能够读懂简单 Ansible PlayBook。<br>
> 熟悉在 Jenkins 建立 Task，添加 Slave Machine，安装插件等操作。

## Ansible
#### 安装
```
sudo apt-get install python-pip
sudo pip install ansible
```

#### 执行Ansible脚本
```
ansible <host_tag> -i <hsot_file> -u <user> -k -m <module> -a <arguments>
ansible-playbook <playbook_path>
```
#### 基本Ansible模块
* ping
* setup
* file
* command / shell


## Maven

#### 使用Maven创建项目
```
sudo apt-get install maven

mvn archetype:create -DgroupId=com.tw.app -DartifactId=devops_demo -DarchetypeArtifactId=maven-archetype-webapp
```

## Jenkins 

#### 用户管理
Manage Jenkins -> Configure Global Security -> Authorization

#### 创建 Job
首先配置编译工具路径

* Manage Jenkins -> Configure System -> JDK: /usr/lib/jvm/java-7-oracle
* Manage Jenkins -> Configure System -> maven: /usr/share/maven

New Item -> Build a maven2/3 project

#### 添加 Slave Machine
Manage Jenkins -> Manage Nodes -> New Node

#### 安装插件
Manage Jenkins -> Manage Plugins -> Available<br>
Filter: Build Pipeline Plugin:

```
https://wiki.jenkins-ci.org/display/JENKINS/Build+Pipeline+Plugin
```
#### 创建 Pipeline
Create view -> Build Pipeline View
