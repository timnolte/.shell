# enable color support of ls & grep, and also add handy aliases
if [ -x "$termux_root"/usr/bin/dircolors ]; then
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
alias vimdiff='nvim -d'

# common workspace cd shortcuts
alias go-w='cd ${workspace}'
alias go-proj='cd ${workspace}/projects'
alias go-wp='cd ${wp_workspace}/wp'
alias go-wpp='cd ${wp_workspace}/wp-content/plugins'
alias go-sfi='cd ${wp_workspace}/wp-content/plugins/scheduled-featured-images'
alias go-ewo='cd ${wp_workspace}/wp-content/plugins/endowp-oembed'
alias go-wjp='cd ${wp_workspace}/wp-content/plugins/jetpack'
alias go-vida='cd ${wp_workspace}/wp-content/themes/wprig-vida-impact-missions'
