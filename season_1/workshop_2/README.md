
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

## Jenkins 

#### 安装 Maven 和 Git
```
sudo apt-get install maven git
```

#### 创建 Update source code job
* New Item -> Build a free-style software project

#### 安装 Git 插件

Manage Jenkins -> Manage Plugins -> Available<br>
Filter: __Git Plugin__

```
https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin
```
```
wget http://10.17.7.20/jenkins-plugins/Git.tar.gz
tar zxf Git.tar.gz -C ~/.jenkins/plugins/
```

#### 安装 Clone Workspace SCM 插件

Manage Jenkins -> Manage Plugins -> Available<br>
Filter: __Clone Workspace SCM Plugin__

```
https://wiki.jenkins-ci.org/display/JENKINS/Clone+Workspace+SCM+Plugin
```
```
wget http://10.17.7.20/jenkins-plugins/Clone_Workspace_SCM.tar.gz
tar zxf Clone_Workspace_SCM.tar.gz -C ~/.jenkins/plugins/
```

#### 创建 Compile job
* New Item -> Build a maven project

#### 配置编译工具路径

* Manage Jenkins -> Configure System -> JDK: /usr/lib/jvm/java-7-oracle
* Manage Jenkins -> Configure System -> maven: /usr/share/maven

#### 创建 Thief job
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

#### 用户管理
* Manage Jenkins -> Configure Global Security -> Authorization

#### 添加 Slave Machine
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

#### 安装 Build Pipeline 插件

Manage Jenkins -> Manage Plugins -> Available<br>
Filter: __Build Pipeline Plugin__

```
https://wiki.jenkins-ci.org/display/JENKINS/Build+Pipeline+Plugin
```
```
wget http://10.17.7.20/jenkins-plugins/Build_Pipeline.tar.gz
tar zxf Build_Pipeline.tar.gz -C ~/.jenkins/plugins/
```

#### 创建 Pipeline
Create view -> Build Pipeline View
