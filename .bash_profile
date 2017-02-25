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

export PATH=$PATH:~/Applications/vertica/opt/vertica/bin:~/Applications/cerveza/bin

#Aliases
alias gco="git checkout"
alias gpr="git pull --rebase"
alias gpu="git push origin"

#Flush the DNS cache
alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

#Powerline shell
function _update_ps1() {
  PS1="$(~/powerline-shell.py $? 2> /dev/null)"
#   PS1="M"
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

GPG_TTY=`tty`
export GPG_TTY
