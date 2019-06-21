export LANG=en_US.UTF-8
export PS1='\D{%d}/\t \u \w\$ '
export EDITOR=aquamacs

export JAVA_HOME=$(/usr/libexec/java_home)
export GRADLE_HOME="/opt/local/share/java/gradle"

export GOPATH=$HOME/workspace/go

paths=(
  "$HOME/.rbenv/shims:$HOME/.rbenv/bin" # rbenv
  "/opt/local/bin:/opt/local/sbin" # macports
  "/Applications/MySQLWorkbench.app/Contents/MacOS" # mysql - Ensure MySQLWorkbench is installed
  "$GOPATH/bin"
)
for path in ${paths[*]}; do
  [[ ":$PATH:" != *":$path:"* ]] && export PATH="${path}:${PATH}"
done

# Git Aliases #
###############
alias gcl='git clone'
alias gadd='git add -u'
alias gconf='git config'
alias gconfg='git config --global'
alias gst='git status'
alias gsts='git status -s'
alias gbr='git branch'
alias gco='git checkout'
alias gpu='git push'
alias gpuu='git push -u origin HEAD'
alias gfp='git fetch --prune'
alias gpl='git pull -r'
alias gcp='git cherry-pick'
alias gmg='git merge'
alias gmgt='git mergetool'
alias gdiff='git difftool'
alias gdiffs='git difftool --staged'
alias glog='git log --date=local --pretty="%h - %cr (%cd) %an, %s" --graph -10'
alias glogg='git log --date=local --pretty="%h - %cr (%cd) %an, %s" --graph -30'
alias glogx='git log --date=local --pretty="%h - %cr (%cd) %an, %s" --graph'
alias glogf='git log --date=local --pretty="%h - %cr (%cd) %an, %s" -10'
alias glogff='git log --date=local --pretty="%h - %cr (%cd) %an, %s" -30'
alias glogfx='git log --date=local --pretty="%h - %cr (%cd) %an, %s"'
alias guc='git reset HEAD^'
alias gucr='git reset --hard HEAD^'
alias grv='git reset --hard HEAD'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grm='git rm --cached'
alias gau='git update-index --assume-unchanged'
alias gnau='git update-index --no-assume-unchanged'
alias grbus='git pull -r && git fetch tala && git rebase tala/release-next && git push'

# Carthage #
############
alias cupdate='carthage update --platform ios'
alias cbootstrap='carthage bootstrap --platform ios'

# Command Line Aliases #
########################
alias brc='source ~/.bashrc'
alias e=echo
alias c=cat
alias h=head
alias t=tail
alias g=rg # ensure ripgrep is installed
alias p=python

alias l='ls -l'
alias lh='ls -lh'
alias lha='ls -lha'
alias lht='ls -lht'
alias lhth='ls -lht | head'

alias w='wc -l'
alias lw='ls | wc -l'

alias targz='tar -zcvf'
alias untar='tar -xvzf'

# External Tools #
##################
alias dm=diffmerge
alias va=vagrant
alias tf=terraform
alias venv='source .venv/bin/activate'
alias dvenv='deactivate'

# MacPort Aliases #
################
alias pt='sudo port'
alias ptu='sudo port selfupdate && sudo port upgrade outdated'

# SSH Proxy #
#############
alias sshtu='ssh -fN $1'
alias sshtc='ssh -O check $1'
alias sshtd='ssh -O exit $1'

# Command Line Function #
#########################
alias pp='ps xwwo pid,ppid,etime,%cpu,command'
alias ppa='ps axwwo pid,ppid,etime,%cpu,command'
alias json='python -mjson.tool'
pg() { pp | awk "/$1/ && "'!/awk/'; }
pag() { ppa | awk "/$1/ && "'!/awk/'; }
suniq() { sort $* | uniq; }

minus() { python - $* <<EOF
import sys; s = set()
for x in file(sys.argv[2]): s.add(x)
for x in file(sys.argv[1]): 
  if x not in s: print x,
EOF
}

cap() { python - $* <<EOF
import sys; s = set()
for x in file(sys.argv[2]): s.add(x)
for x in file(sys.argv[1]): 
  if x in s: print x,
EOF
}
