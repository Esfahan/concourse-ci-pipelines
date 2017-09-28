#!/bin/bash
# Create ssh key file
mkdir ~/.ssh/
chmod 700 ~/.ssh
echo "${GIT_SSH_KEY}" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# ssh-agent
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
ssh-add -l

# deploy
cd capistrano-sample
bundle install --path vendor/bundle
bundle exec cap development deploy
