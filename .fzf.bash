# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tim/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/tim/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tim/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/tim/.fzf/shell/key-bindings.bash"
