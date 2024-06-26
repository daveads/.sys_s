# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.sys_s/src/sys_config/bash_conf/.aliases ]; then
    . ~/.sys_s/src/sys_config/bash_conf/.aliases
fi


#Exports
source /home/daveads/.sys_s/src/sys_config/bash_conf/languages_export.sh


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/$USER/.sdkman"
[[ -s "/home/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/home/$USER/.sdkman/bin/sdkman-init.sh"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

#Java bin

#
#ln -s ~/.sdkman/  $HOME/sdkman
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/
export PATH=${PATH}:${JAVA_HOME}/bin

# Android sdk  
if [ -f ~/.sys_s/src/dev_env/android_env_setup ]; then
    . ~/.sys_s/src/dev_env/android_env_setup
fi

# mouse click lxqt && lxde
if [ -f ~/.sys_s/src/sys_config/mouse ]; then
	. ~/.sys_s/src/sys_config/mouse
fi

#Android studio IDE Bin
export PATH=$PATH:/home/$USER/ide/eclipse

# Dart programming lang bin

#dart programming language  //flutter comes with one 
#export dart_HOME=/usr/local/dart-sdk
#export PATH=${PATH}:${dart_HOME}/bin

# Flutter bin
export flutter_HOME=/usr/local/flutter
export PATH=${PATH}:${flutter_HOME}/bin

#
# MAJOR TOOLS AND automating scripts
#
#my_own bash scripts...
export SYS_S=/home/$USER/.sys_s
export PATH=$PATH:"/home/$USER/.sys_s/src"
export PATH=$PATH:"/home/$USER/.sys_s/src/ba3"
export PATH=$PATH:"/home/$USER/.sys_s/src/py_s"
export PATH=$PATH:"/home/$USER/.sys_s/src/sys_config"

## daveads
export PATH=$PATH:"/home/$USER/Desktop/daveads.github.io/scripts"

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# set PROMPT_COMMAND
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
[ -f "/home/$USER/.ghcup/env" ] && source "/home/$USER/.ghcup/env" # ghcup-env

# history with time
export HISTTIMEFORMAT="%c "

# will have to changes this later 
#Libaries and tools
export kot=/home/$USER/Desktop/kotlin/kt/toolK
export PATH=$PATH:"/home/$USER/Desktop/kotlin/kt/toolK"

# pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


#Starship
#Starship – Cross-shell prompt 
eval "$(starship init bash)"
export STARSHIP_CONFIG="$HOME/.starship/starship.toml"
export STARSHIP_CACHE=~/.starship/cache
. "$HOME/.cargo/env"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# eval $(keychain --eval github)

# file-system/partition
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# Tensorflow on CPU !GPU
export TF_CPP_MIN_LOG_LEVEL=2

# chrome
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export EDITOR="nvim"

RUST_BACKTRACE=1

# pipenv
PIPENV_IGNORE_VIRTUALENVS=1

# screen multi-tourch
#xinput disable 'G2Touch Multi-Touch by G2TSP' #xinput set-prop 9 185 0

# ruby shits
GEM_HOME="/home/daveads/gems"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/daveads/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/daveads/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/daveads/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/daveads/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/daveads/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/daveads/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# unzip
UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE

# waydroid 
#export WAYLAND_DISPLAY="wayland-0"
#export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus


#graalvm
export PATH=/usr/lib/jvm/java-17-graalvm/bin:$PATH
#eval "$(~/.rbenv/bin/rbenv init - bash)"
#eval "$(zellij setup --generate-auto-start bash)"
