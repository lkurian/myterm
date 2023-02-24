PATH=$PATH:~/.cabal/bin
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export LESS=-R

alias ls='ls -FG'
alias cls='clear'
alias ll='ls -lFG'
alias ..='cd ..'
alias a='ack-grep'


# zshmarks aliases to make it similar to bashmarks
alias j="jump"
alias s="bookmark"
alias d="deletemark"
alias lb="showmarks"

# source /etc/bash_completion.d/git
# source ~/.rvm/scripts/rvm

# export JAVA_OPTS="-d64"
export JRUBY_OPTS="--1.9 -X+O"

HISTSIZE=5000
HISTFILESIZE=5000

export LS_COLORS="no=00:fi=00:di=00;36:ln=00;35:pi=40;33:so=00;35;33;00:cd=40;33;00:or=40;31;00:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.deb=00;31:*.rpm=00;31:*.jpg=00;35:*.png=00;35:*.gif=00;35:*.bmp=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.png=00;35:*.mpg=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$JAVA_HOME/bin:$GRAILS_HOME/bin:$GROOVY_HOME/bin:$JAVA_HOME/bin:$SOLR_HOME/bin$PATH
PATH=$PATH:/usr/local/rvm/bin # Add RVM to PATH for scripting

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# source ~/.git-completion.bash
# function parse_git_dirty {
#   [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
# }
#
# function parse_git_branch {
#   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
# }
#
# source ~/.local/bin/bashmarks.sh

