### Ensure Vagrant can use ssh

Test SSH availiable:

```
ssh -p '2222' 'vagrant@127.0.0.1'
```

If there need input your password please flow the next step


For Mac User:




1, Use brew install ssh-copy-id

```
brew install ssh-copy-id
```
2, Use ssh-copy-id upload your public ssh key

```
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@127.0.0.1 -p 2222
```

console output

```
/usr/local/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/local/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
vagrant@127.0.0.1's password:

Number of key(s) added:        1

Now try logging into the machine, with:   "ssh -p '2222' 'vagrant@127.0.0.1'"
and check to make sure that only the key(s) you wanted were added.
```

3, Run ```ssh -p '2222' 'vagrant@127.0.0.1'``` test again.

### Install Ansible in your Mac

```
brew install ansible
```

Ensure the install


```
ansible -i hosts all -m ping -u vagrant
```

should return:

```
localhost | success >> {
    "changed": false,
    "ping": "pong"
}
```
