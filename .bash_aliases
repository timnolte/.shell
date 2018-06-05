# enable color support of ls & grep, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
fi

# shell shotcuts
alias termc='termux-chroot'

# some more ls aliases
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -lah'
alias l='ls -CF'

# file manipulation
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

# vim && neovim
# clean the vim swap file
alias nvimc='rm -I ~/nvim/swap/*'
alias nvimcu='rm -I ~/nvim/undo/*'
alias vim='nvim'
alias vi='nvim'

# common workspace cd shortcuts
alias go-wp='cd ~/workspace/wpdev/wp'
alias go-wpp='cd ~/workspace/wpdev/wp-content/plugins'
alias go-sfi='cd ~/workspace/wpdev/wp-content/plugins/scheduled-featured-images'
alias go-wpsqrl='cd ~/workspace/wpdev/wp-content/plugins/wp-sqrl'
alias go-ewo='cd ~/workspace/wpdev/wp-content/plugins/endowp-oembed'
