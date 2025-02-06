
# If needing to install postgres utils:
# https://stackoverflow.com/questions/44654216/correct-way-to-install-psql-without-full-postgres-on-macos
# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# If using python globally:
# export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="geoffgarside"

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

alias git-dangerously-prune-branches="git branch | grep -v 'develop' | grep -v 'master' | grep -v 'main' | xargs git branch -D"
alias git-prune-merged-branches="git branch --merged | grep -v \* | xargs git branch -D"
alias git-hard-reset="git clean -fd && git reset --hard"

# If multiple ssh keys should be used:
# ssh-add ~/.ssh/id_ed25519 -q
# ssh-add ~/.ssh/another_id_ed25519 -q