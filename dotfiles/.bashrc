# .bashrc v1.0
# Script that Bash runs when it is started interactively
# Sets-up environment variables, aliases, functions
#

# Modifications:
# (1.00) Kent - Creation

# If loading of bashrc is not for ssh, do not continue
if [ -z "$PS1" ]; then
    return
fi

export TERM=xterm-256color

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# XPT2-NCA Development Environment set-up
export PATH=$PATH:$HOME/bin:/sbin:/usr/local/share/ARM/DS-5/5040081/bin:/usr/local/bin/nodejs/bin
export PATH=$PATH:/usr/local/share/ARM/RVCT/Programs/3.1/569/linux-pentium
export PATH=$PATH:/usr/local/share/eclipse
export PATH=$PATH:/xpttools/v3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/root/bin:/sbin:/usr/local/share/ARM/linux-pentium
export installRoot=/usr/local/share/ARM
export ARMLMD_LICENSE_FILE=2700@172.27.209.18
export RVCT31LIB=/usr/local/share/ARM/RVCT/Data/3.1/569/lib
export RVCT31INC=/usr/local/share/ARM/RVCT/Data/3.1/569/include/unix

# Remove invalid directories in PATH
PATH=$(for d in ${PATH//:/ } ; do [ -x $d ] && printf "$d\n"; done | uniq | tr '\12' ':')
export PATH=${PATH%?}

# Load aliases
source ~/.aliases;

# Load compiler commands
source ~/.compiler;

# Load bash prompt
source ~/.bashprompt;

# Load up command
source ~/.up;

# Load ag command
source ~/.ag;

# Load git hooks environment variables
source ~/.githooks;

# Load git auto-completion
source ~/.gitauto;

# Load trash - rm command disabler
source ~/.trash;

# Colors used for ls output
export LS_COLORS="di=37:ln=36:ex=32"

# Save command history to a file
export PROMPT_COMMAND='echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log'

# Directories to be searched by cd command
export CDPATH=".:~:$HOME/Workspace/:/mnt/hgfs"

# Workaround for NCA DryICE limitation
ulimit -s 8192

# Additional/Auto-generated below
