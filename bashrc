#!/bin/bash

# Author: Andrew Dean
# Description: Personal Bashrc

###############################################################################
# SETUP
###############################################################################

# Source bash profile
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/andrewdean/.sdkman"
[[ -s "/Users/andrewdean/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/andrewdean/.sdkman/bin/sdkman-init.sh"
