# Setup fzf
# ---------
if [ ! "$PATH" == */.fzf/bin* ]; then
  export PATH=$PATH:~/.fzf/bin
fi

# Auto-completion
# ---------------
if [ $- == *i* ]; then
  . ~/.fzf/shell/completion.bash
fi

# Key bindings
# ------------
if [ -f ~/.fzf/shell/key-bindings.bash ]; then
. ~/.fzf/shell/key-bindings.bash
fi
