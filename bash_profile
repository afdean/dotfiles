#!/bin/bash

# Author: Andrew Dean
# Description: Personal Bash Profile

###############################################################################
# VARIABLES
###############################################################################

# Get OS for conditional checks
# This isn't robust towards ubuntu, simply a substitute for now
if [ $(uname -s) == Linux ]
then
    currentos=ubuntu
elif [ $(uname -s) == Darwin ]
then
    currentos=macos
else
    currentos=unknown
fi

# Directories
dot_dir=~/dotfiles

###############################################################################
# TERMINAL APPEARANCE
###############################################################################

# Enable git tab completion
source $dot_dir/git/git-completion.bash

# Set up colors (0; means normal, 1; means bold)
white="\e[255m"
green="\[\033[1;32m\]"
teal="\[\033[1;36m\]"
purple="\[\033[1;35m\]"
red="\[\033[1;31m\]"
#blue="\[\033[0;34m\]"
yellow="\[\033[1;33m\]"
reset="\[\033[0m\]"

# Change command prompt
source $dot_dir/git/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# $color_name precedes anything that should use that color
# Use spacing to display things cleaner on cmd line
export PS1="$purple\u $red\@ $yellow\!$green\$(__git_ps1) $teal\W $ $reset"

# Change lscolors
if [ $currentos == "macos" ]
then
    # Order: dir, sym link, socket, pipe, executable, block special,
    #    character special, executable with setuid bit set,
    #    executable with setgid bit set,
    #    directory writable to others (sticky bit), directory writable to others
    # Colors (pairs): a black, b red, c green, d brown, e blue, f magenta,
    #    g cyan, h light grey, x default foreground/background
    # Default: LSCOLORS=exfxcxdxbxegedabagacad
    export LSCOLORS=GxFxCxDxBxegedabagacEd
fi

###############################################################################
# ALIASES
###############################################################################

# Utilities
alias checkstyle='java -jar ~/dotfiles/utilities/checkstyle-8.0-all.jar -c /sun_checks.xml'
alias findbugs='java -jar ~/dotfiles/utilities/findbugs-3.0.1/lib/findbugs.jar -textui'
# TODO: Fix this when I can figure out pathing problem
alias ja="java -cp '.:/Users/andrewdean/dotfiles/utilities/algs4.jar'"
alias jc="javac -cp ~/dotfiles/utilities/algs4.jar"
alias ju="java org.junit.runner.JUnitCore"

if [ $currentos == "macos" ]
then
    alias tsl='~/dotfiles/utilities/tsl_mac --disable-data-collection'
elif [ $currentos == "ubuntu" ]
then
    alias tsl='~/dotfiles/utilities/tsl_linux --disable-data-collection'
fi

# Normal aliases
if [ $currentos == "macos" ]
then
    alias ll='ls -lahGFP'
    # Colored 'cat'
    alias c='pygmentize -O style=monokai -f console256 -g'
elif [ $currentos == "ubuntu" ]
then
    alias ll='ls -lahFP --color=auto'
fi

alias ..='cd ../'
alias ...='cd ../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias b='cd -'
alias cask='brew cask'
alias h='history'
alias home='cd ~'
alias o='open'
alias oo='open .'
alias ipython='python -m IPython'
# Only list directories
alias lsd='gls -l | grep "^d"'
alias up='cd ..'
alias v='vim'

# Idiot proof aliases
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias grep='grep -E'
alias sed='sed -E'

# Git aliases
alias gal='git add -A'
alias gc='git checkout'
alias gcl='git clone'
alias gim='git commit'
alias gl='git log'
alias gs='git status'
alias guom='git pull origin master'
alias gsom='git push origin master'
alias undopush="git push -f origin HEAD^:master"

# Function aliases (keep separate and at end of aliases)
if [ $currentos == "macos" ]
then
    cd() { builtin cd "$@"; ll; }
    trash() { command mv "$@" ~/.Trash ; }
fi

###############################################################################
# HISTORY
###############################################################################

export HISTSIZE=10000                   # 500 is default...
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p ' # Uses strftime format
export HISTCONTROL=ignoreboth           # ignoredups:ignorespace
export HISTIGNORE="history:h:pwd:exit:df:ls:ls -la:ll:ls -a:"

###############################################################################
# GREP
###############################################################################

# order is text style, text color, text background color)
export GREP_COLOR="1;33"
export GREP_OPTIONS="--color=auto"

###############################################################################
# PATH
###############################################################################

if [ $currentos == "macos" ]
then
    PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
    export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
    export JUNIT_HOME="$HOME/dotfiles/utilities/junit"
    export PATH=${JAVA_HOM}/bin:${PATH}
    export PATH=/opt/apache-maven-3.5.0/bin:$PATH
    export PATH="$PATH:$JUNIT_HOME"
    export CLASSPATH=export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.10.jar:$JUNIT_HOME/hamcrest-core-1.3.jar"
elif [ $currentos == "ubuntu" ]
then
    export JAVA_HOME="/usr/lib/jvm/default-java"
    export PATH=$JAVA_HOME:$PATH
fi
export PATH

###############################################################################
# OS SPECIFIC SETTINGS
###############################################################################

if [ $currentos == "macos" ]
then
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    export HOMEBREW_CASK_OPTS=--require-sha
fi
