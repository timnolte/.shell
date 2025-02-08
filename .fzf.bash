# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tim/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/tim/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/tim/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/tim/.fzf/shell/key-bindings.bash"
