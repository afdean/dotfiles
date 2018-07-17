#!/bin/bash

# Author: Andrew Dean
# Description: Personal Bashrc

# ----------------------------------------------------------------------------
# Setup
#

# Source bash profile
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/andrewdean/.sdkman"
[[ -s "/Users/andrewdean/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/andrewdean/.sdkman/bin/sdkman-init.sh"
