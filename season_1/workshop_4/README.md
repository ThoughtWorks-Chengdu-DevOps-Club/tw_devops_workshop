# Workshop Final

## Build Steps
1. in _env/_ Run

    vagrant up

2. in _env/ansible/_ Run

    ansible-playbook -i hosts site.yml

3. in browser, go to [Jenkins Home](http://10.1.2.21:8080), check that the pipeline is there and packages have been deployed to the server.

4. in browser, go to [Pet Store](http://10.1.2.24:8080/jpetstore), check that the application is deployed properly
