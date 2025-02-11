# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# On CodeAnywhere change to the workspace
if [ "$USER" = "cabox" ]; then
  cd ~/workspace
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set a variable to identify running under Termux
termux_root=
if [ -d /data/data/com.termux/files ]; then
  termux_root=/data/data/com.termux/files
fi

# set a development workspace directory
workspace=~/workspace

# set a WordPress development workspace directory
wp_workspace="$workspace"
if [ -d "$workspace"/wpdev ]; then
  wp_workspace="$workspace"/wpdev
fi

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
[ -x "$termux_root"/usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x "$termux_root"/usr/bin/tput ] && tput setaf 1 >&/dev/null; then
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f "$termux_root"/usr/share/bash-completion/bash_completion ]; then
    . "$termux_root"/usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Add npm completion
  if [ -f ~/.local/share/bash-completion/completions/npm.bash ]; then
    . ~/.local/share/bash-completion/completions/npm.bash
  fi

  # Add docker-compose completion
  if [ -f ~/.local/share/bash_completion/completions/docker-compose.bash ]; then
    . ~/.local/share/bash_completion/completions/docker-compose.bash
  fi

  # Add rclone Bash Completion
  if [ -f ~/.local/share/bash-completion/completions/rclone.bash ]; then
    . ~/.local/share/bash-completion/completions/rclone.bash
  fi

  # Add WordPress Bash Completion
  if [ -f ~/.local/share/bash-completion/completions/wp.bash ]; then
    . ~/.local/share/bash-completion/completions/wp.bash
  fi

  # Add GitHub CLI Bash Completion
  if [ -f ~/.local/share/bash-completion/completions/gh.bash ]; then
    . ~/.local/share/bash-completion/completions/gh.bash
  fi

  # Add WP-CLI Bash Completion
  if [ -f ~/.local/share/bash-completion/completions/wp.bash ]; then
    . ~/.local/share/bash-completion/completions/wp.bash
  fi

  # Add nala Bash Completion
  if [ -f ~/.local/share/bash-completion/completions/nala.bash ]; then
    . ~/.local/share/bash-completion/completions/nala.bash
  fi

  # Add DevPod CLI Bash Completion
  if [ -f ~/.local/share/bash-completion/completions/devpod.bash ]; then
    . ~/.local/share/bash-completion/completions/devpod.bash
  fi
fi

# Add additional LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$termux_root"/usr/local/lib

# Add additional directories to PATH
export PATH=$PATH:"$termux_root"/usr/local/bin

if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:$PATH
fi
if [ -d ~/.composer/vendor/bin ]; then
  export PATH=$PATH:~/.composer/vendor/bin
fi
if [ -d "$workspace"/vendor/bin ]; then
  export PATH=$PATH:"$workspace"/vendor/bin
fi
if [ -d "$wp_workspace"/vendor/bin ]; then
  export PATH=$PATH:"$wp_workspace"/vendor/bin
fi
if [ -d ~/vendor/bin ]; then
  export PATH=$PATH:~/vendor/bin
fi
if [ -d ~/.buildkite-agent/bin ]; then
  export PATH=$PATH:~/.buildkite-agent/bin
fi

# Set GO path
if [ -d ~/go/bin ]; then
  export GOPATH=~/go
fi

# Add GO bin to PATH
if [ -d ~/go/bin ]; then
  export PATH=$PATH:$GOPATH/bin
fi

# Set Ruby user install path
if [ -d ~/.gem/ruby/2.5.0/bin ]; then
  export PATH=$PATH:~/.gem/ruby/2.5.0/bin
fi

# Define a home-based tmp
export TMPDIR=~/.tmp

# Java Environment Setup
if [ -d /usr/lib/jvm/java-11-openjdk-amd64 ]; then
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
fi

# WordPress Test Suite Setup
if [ -d "$TMPDIR"/wordpress-tests-lib ]; then
  export WP_TESTS_DIR=$TMPDIR/wordpress-tests-lib
fi
if [ -d "$TMPDIR"/wordpress ]; then
  export WP_CORE_DIR=$TMPDIR/wordpress
fi

# Default Editor Setup
if hash nvim 2>/dev/null; then
  export EDITOR=nvim
elif hash vim 2>/dev/null; then
  export EDITOR=vim
elif hash vi 2>/dev/null; then
  export EDITOR=vi
fi

# SSH Agent Startup
SSH_ENV="$HOME/.ssh/environment"
SSH_KEYS=( "$HOME/.ssh/timnolte_id_rsa" "$HOME/.ssh/tnolte_id_rsa" )

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    for SSH_KEY in "${SSH_KEYS[@]}"
    do
      /usr/bin/ssh-add "${SSH_KEY}";
    done
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# GPG Configuration
export GPG_TTY=$(tty)

# F1 CLI SSL
export F1_TLS_CERT=
export F1_TLS_KEY=

# FZF Setup
if [ -f ~/.fzf.bash ]; then
  . ~/.fzf.bash
fi

# added by travis gem
[ -f /home/tim/.travis/travis.sh ] && source /home/tim/.travis/travis.sh
