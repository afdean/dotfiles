# Enable git tab completion
source ~/dotfiles/git/git-completion.bash

# Set up colors
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
teal="\[\033[0;36m\]"
brown="\[\033[0;31m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/dotfiles/git/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# $color_name precedes anything that should use that color
# Use spacing to display things cleaner
export PS1="$purple\u$teal \@$brown \!$green\$(__git_ps1)$blue \W $ $reset"

# Set up aliases
#   Utilities 
alias checkstyle='java -jar ~/dotfiles/utilities/checkstyle-8.0-all.jar -c /sun_checks.xml'
alias findbugs='java -jar ~/dotfiles/utilities/findbugs-3.0.1/lib/findbugs.jar -textui'
alias tsl='~/dotfiles/utilities/tsl/tsl'
alias ipython='python -m IPython'

alias ll='ls -lahG'
alias home='cd ~'
alias up='cd ..'
alias h='history'
#    Idiot proof aliases
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
alias grep='grep -E'
alias sed='sed -E'
#    Git aliases
alias guom='git pull origin master'
alias gsom='git push origin master'
alias gal='git add -A'
alias gim='git commit'

# Set up history settings
export HISTSIZE=10000                   # 500 is default...
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p ' # Uses strftime format
export HISTCONTROL=ignoreboth           # ignoredups:ignorespace
export HISTIGNORE="history:h:pwd:exit:df:ls:ls -la:ll:ls -a:"

# Set up GREP settings (order is text style, text color, text background color)
export GREP_COLOR="1;33"
export GREP_OPTIONS="--color=auto"

# Set PATH
#    This is set for MacOS
#    The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export PATH=${JAVA_HOM}/bin:${PATH}
export PATH=/opt/apache-maven-3.5.0/bin:$PATH
#    This is set for Ubuntu
# export JAVA_HOME="/usr/lib/jvm/default-java"
# export PATH=$JAVA_HOME:$PATH
export PATH

# Git settings
git config --global push.default upstream
git config --global merge.conflictstyle diff3
# The original version is saved in .bash_profile.pysave
