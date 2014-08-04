#!/bin/bash
PORT=8080

shopt -s expand_aliases
alias jenkins-cli="java -jar jenkins-cli.jar -s http://localhost:${PORT}/"
wget http://localhost:${PORT}/jnlpJars/jenkins-cli.jar -O jenkins-cli.jar

if [ -d plugin ]; then
    touch /dev/null  # do nothing
else
    mkdir plugin     # download plugins
    cd plugin
    wget "http://mirrors.jenkins-ci.org/plugins/clone-workspace-scm/latest/clone-workspace-scm.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/jquery/latest/jquery.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/parameterized-trigger/latest/parameterized-trigger.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/build-pipeline-plugin/latest/build-pipeline-plugin.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/credentials/latest/credentials.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/ssh-credentials/latest/ssh-credentials.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/git-client/latest/git-client.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/scm-api/latest/scm-api.hpi"
    wget "http://mirrors.jenkins-ci.org/plugins/git/latest/git.hpi"
    cd -
fi

jenkins-cli install-plugin ./plugin/clone-workspace-scm.hpi

jenkins-cli install-plugin ./plugin/jquery.hpi
jenkins-cli install-plugin ./plugin/parameterized-trigger.hpi
jenkins-cli install-plugin ./plugin/build-pipeline-plugin.hpi

jenkins-cli install-plugin ./plugin/credentials.hpi
jenkins-cli install-plugin ./plugin/ssh-credentials.hpi
jenkins-cli install-plugin ./plugin/git-client.hpi
jenkins-cli install-plugin ./plugin/scm-api.hpi
jenkins-cli install-plugin ./plugin/git.hpi

jenkins-cli restart
echo "restarting jenkins.."
sleep 40s

jenkins-cli create-job update < /template/update.job
jenkins-cli create-job compile < /template/compile.job
jenkins-cli create-view jpetstore < /template/jpetstore.view

jenkins-cli build update

unalias jenkins-cli
rm -f jenkins-cli.jar
