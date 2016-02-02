#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# aliases
alias ls='ls --color=auto --group-directories-first -h'
alias la='ls -a'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias atom='~/Downloads/atom-editor/pkg/atom-editor/usr/bin/atom'

# PS1 with error, and git info
__set_ps1 (){
    local err="\[\033[1;31m\]" # error -- red
    local nor="\[\033[1;37m\]" # normal -- white
    local por="\[\033[1;34m\]" # prompt char
    local dirty="\[\033[0;34m\]" # dirty git
    local rst="\[\033[0m\]"    # Text Reset
    
    # git info
    local gitinfo=
    local branch=$(git symbolic-ref HEAD --short 2> /dev/null)
    if [[ $branch ]]; then
        x=$(git status --porcelain)
        if [[ $x ]]; then
            gitinfo="${nor}(${dirty}${branch}${nor}) "
        else
            gitinfo="${nor}(${branch}) "
        fi
    fi
    #
    # generate prompt
    PS1="\n \$([[ \$? != 0 ]] && echo \"$err\" || echo \"$nor\")\W ${gitinfo}${por}λ $rst"
}
# set PS1
PROMPT_COMMAND="__set_ps1"

# create command not found hook
# source /usr/share/doc/pkgfile/command-not-found.bash

# history settings
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="cd *:ls:ls *:history*:cat *:clear:pwd:..:..."

# disable flow control
stty -ixon
