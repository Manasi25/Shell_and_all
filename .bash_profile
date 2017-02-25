# for homebrew on OSX
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

complete -C aws_completer aws

alias key="cat ~/.ssh/id_rsa.pub | pbcopy"

export VIMRUNTIME=/usr/share/vim/vim73
alias vim=" mvim -v"

# put the git branch name in your prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#if [ $(parse_git_branch) = "(dev)" ]; then
#  export PS1="\u@\h \w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
#else
#  export PS1="\u@\h \w\[$(tput setaf 1)\]\$(parse_git_branch)\[$(tput setaf 7)\] $ "
#fi
# put a function at the front that checks parse_git_branch and depending on the result, it'll change colors that way
export PS1="[\D{%F %T}] \u@\h \w\ [\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# make playtime the default aws account
source ~/.aws/playtime

export PATH=$PATH:~/Applications/vertica/opt/vertica/bin:~/Applications/cerveza/bin

#Aliases
alias gco="git checkout"
alias gpr="git pull --rebase"
alias gpu="git push origin"

alias vsql_prod="vsql -h stats-dc.tmogul.com -U dbadmin -w '0VZZQK8Yp3QufAxUFSJt_K1g'"
alias vsql_sb="vsql -h stats-dc-sb.tmogul.com -U dbadmin -w '0VZZQK8Yp3QufAxUFSJt_K1g'"
alias vsql_dev="vsql -h dev-stats-dc01.dev.us-east-1d.public -U dbadmin -w 'ewAZQ9cjkuqLcvZy9GV0ZSLM'"

# GIT repo shortcut with latest pull and rebase
alias cvz="cd /Users/manasi.limbachiya/work/cerveza && virtualenv .venv && source .venv/bin/activate && gpr"
alias ngs="cd /Users/manasi.limbachiya/work/tm_nagios && gpr"
alias pup="cd /Users/manasi.limbachiya/Documents/puppet && gpr"
alias p3="cd /Users/manasi.limbachiya/work/puppet-3 && gpr"
alias rol="cd /Users/manasi.limbachiya/work/role && gpr"
alias prof="cd /Users/manasi.limbachiya/work/profile && gpr"
alias jenk="cd /Users/manasi.limbachiya/work/jenkins-job-dsl && gpr"
alias r10="cd /Users/manasi.limbachiya/work/r10k && gpr"
alias fls="cd /Users/manasi.limbachiya/work/fileservers.git && gpr"
alias hapro="cd /Users/manasi.limbachiya/work/haproxy && gpr"
alias EXP="cd /Users/manasi.limbachiya/work/experiments"

#Flush the DNS cache
alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

#Mysql server aliases
alias dbro="ssh dbro.tubemogul.com"
alias dolp="ssh dev-oltp01"
alias udbo="ssh userdb-oltp.dev.us-east-1e.public"
alias uio="ssh ui-oltp.dev.us-east-1e.public"
alias mlo="ssh ml-oltp.dev.us-east-1e.public"
alias rtbo="ssh rtb-oltp.dev.us-east-1e.public"


#Puppet
alias master04="ssh puppet-master04.us-east-1a.public"
alias master03="ssh puppet-master03.us-east-1a.public"

#Powerline shell
function _update_ps1() {
  PS1="$(~/powerline-shell.py $? 2> /dev/null)"
#   PS1="M"
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#Novaclient config
#SJC
export OS_AUTH_URL=http://172.16.103.21:5000/v2.0
export OS_USERNAME=rtb
export OS_PASSWORD=HMpP785eUuwVB4tt
#export OS_USERNAME=admin
#export OS_PASSWORD=admin_pass
export OS_TENANT_NAME=rtb

GPG_TTY=`tty`
export GPG_TTY

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
export PATH="/usr/local/sbin:$PATH"
