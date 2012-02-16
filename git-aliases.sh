#!/bin/sh
#

# These are some of my "workhorse" aliases.
# There are a lot of fancier ones which come up less frequently
# which I'll put somewhere else eventually.

alias g='git'

# branching, committing
alias gbgrep='git branch -a | grep $*'
alias gco='git checkout $*'
alias gup='git checkout master && git pull && git remote update -p'
alias gupd='git commit -a --amend -C HEAD'
alias gam='git commit -a -m'

# merging, rebasing, modifying the tree
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD^'
alias gmm='git merge master'
alias grm='git rebase master'
alias grim='git rebase -i master'
alias gra='git rebase --abort'

# log/info
alias glog-nm='git log --no-merges ^master'
alias glog-this='git log --no-merges ^master HEAD'
alias glog..='git log --no-merges master.. -- src'
alias glog2="git log --simplify-by-decoration --date-order --format='%Cred%h%Creset %s %Cgreen(%cr)%Creset' --abbrev=10 --abbrev-commit --graph --decorate --date=relative"
alias glog3="git log --graph --pretty=format:'%Cred%h%Creset - %C(yellow)%an%Creset %m - %s %Cgreen(%cr)%Creset' --abbrev=10 --abbrev-commit --date=relative"
alias gdesc='git describe --always'

# diff
alias gdm='git diff master'
alias gds='git diff --stat=150,150'
alias gdsh='git diff --stat=150,150 HEAD^'
alias gdsm='git diff --stat=150,150 master'
alias gdh='git diff HEAD^ HEAD'
alias gdm...='git diff master... -- src'
alias gdsm...='git diff -w --stat master... -- src'

# obscurer but useful things
alias git-checkout-all='git fetch . refs/remotes/*:refs/HEADs/*'
alias git-local-checkout-all='git co HEAD^ && git fetch . refs/remotes/origin/*:refs/HEADs/* && git co master && git branch -D HEAD'
alias git-show-blobs='git verify-pack -v .git/objects/pack/pack-*.idx | sort -k3n'
alias git-ls-remote-tags='git ls-remote --tags origin'
