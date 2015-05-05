export PS1='\D{%d}/\t \u \w\$ '
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=/usr/local/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:$ANDROID_HOME/tools/:$ANDROID_HOME/platform-tools/:$PATH

# Git Aliases #
###############
alias gadd='git add -u'
alias gconf='git config'
alias gconfg='git config --global'
alias gst='git status'
alias gsts='git status -s'
alias gbr='git branch'
alias gco='git checkout'
alias gpu='git push'
alias gpl='git pull -r'
alias gcp='git cherry-pick'
alias gmg='git merge'
alias gmgt='git mergetool -t=diffmerge'
alias gdiff='git difftool -t=diffmerge'
alias gbl='git blame -L'
alias glog='git --no-pager log --date=local --pretty="%h - %cr (%cd) %an, %s" --graph -10'
alias glogg='git --no-pager log --date=local --pretty="%h - %cr (%cd) %an, %s" --graph -30'
alias glogx='git --no-pager log --date=local --pretty="%h - %cr (%cd) %an, %s" --graph'
alias glogf='git --no-pager log --date=local --pretty="%h - %cr (%cd) %an, %s" -10'
alias glogff='git --no-pager log --date=local --pretty="%h - %cr (%cd) %an, %s" -30'
alias glogfx='git --no-pager log --date=local --pretty="%h - %cr (%cd) %an, %s"'
alias guc='git reset HEAD^'
alias gucr='git reset --hard HEAD^'
alias grv='git reset --hard HEAD'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gcmt='git pair-commit -a -m'
alias gcmtr='git pair-commit -m'
alias grm='git rm --cached'
alias gau='git update-index --assume-unchanged'
alias gnau='git update-index --no-assume-unchanged'

# Command Line Aliases #
########################
alias brc='source ~/.bashrc'
alias p='python'
alias e='echo'
alias c='cat'
alias h='head'
alias t='tail'
alias g='grep'
alias l='ls -l'
alias lh='ls -lh'
alias lha='ls -lha'
alias lht='ls -lht'
alias lhth='ls -lht | head'
alias w='wc -l'
alias lw='ls | wc -l'
alias m='/simple/ocaml/_build/main.native'
alias rds='mysql -h db.cnsig2wpmeqb.us-west-2.rds.amazonaws.com -u main -psimple-rules -P 3306 main'
alias key1='master-key2'
alias key2='master-key1'
alias dyg='dynamo-get'

# Gradle Aliases #
##################
alias gwtd='./gradlew clean testDebug'
alias gwrd='./gradlew clean build --refresh-dependencies'

# Command Line Function#
########################
alias pp='ps xwwo pid,ppid,etime,%cpu,command'
alias ppa='ps axwwo pid,ppid,etime,cpu,command'
alias json='python -mjson.tool'
pg() { pp | awk "/$1/ && "'!/awk/'; }
pag() { ppa | awk "/$1/ && "'!/awk/'; }
suniq() { sort $* | uniq; }

# added by travis gem
[ -f /Users/pivotal/.travis/travis.sh ] && source /Users/pivotal/.travis/travis.sh
