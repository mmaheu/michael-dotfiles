### ANSI COLORS
NORMAL="\[\e[0m\]"     # NORMAL RESET
RED="\[\e[31m\]"       # RED
GREEN="\[\e[32m\]"     # GREEN
YELLOW="\[\e[33m\]"    # YELLOW
BLUE="\[\e[34m\]"      # BLUE
MAGENTA="\[\e[1;35m\]" # MAGENTA
CYAN="\[\e[36m\]"      # CYAN
WHITE="\[\e[1;37m\]"   # BOLD WHITE
YONR="\[\e[33;41m\]"   # SUDO YELLOW ON RED

# No brainer, default to Vim
export EDITOR="vim"

# Color LS output to differentiate between directories and files
export LS_OPTIONS="--color=auto"
export CLICOLOR="Yes"
export LSCOLOR=""

GIT_CLEAN=$CYAN
GIT_DIRTY=$RED

# Add Current Branch to Prompt
git_prompt() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  GIT_BRANCH=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    GIT_COLOR=$GIT_CLEAN
  else
    GIT_COLOR=$GIT_DIRTY
  fi

  echo "[$GIT_COLOR$GIT_BRANCH$NORMAL]"
}

# Setting Bash Prompt
# default is \h (host) \w (current file path, 'W' shows current file only) \u (user)
PROMPT_COMMAND='PS1=$CYAN"\w "$(git_prompt)$WHITE" >"$NORMAL" "'

# Setting Sudo Bash Prompt
export SUDO_PS1=$YONR"[\h] \w \u #"$NORMAL" "
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
