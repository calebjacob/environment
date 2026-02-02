
# If needing to install postgres utils:
# https://stackoverflow.com/questions/44654216/correct-way-to-install-psql-without-full-postgres-on-macos
# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# If using python globally:
# export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="geoffgarside"

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

alias git-dangerously-prune-branches="git branch | grep -v 'develop' | grep -v 'master' | grep -v 'main' | xargs git branch -D"
alias git-prune-merged-branches="git branch --merged | grep -v \* | xargs git branch -D"
alias git-hard-reset="git clean -fd && git reset --hard"
alias cursor="code"
alias p="pnpm"

# If multiple ssh keys should be used:
# ssh-add ~/.ssh/id_ed25519 -q
# ssh-add ~/.ssh/another_id_ed25519 -q

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/caleb/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/caleb/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
