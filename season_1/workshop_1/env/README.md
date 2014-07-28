### Ensure the ansible can access to vagrant

```
ansible -i hosts all -m ping -u vagrant -i hosts
```

should return:

```
localhost | success >> {
    "changed": false,
    "ping": "pong"
}
```
