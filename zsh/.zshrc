# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

# Add a blank line before new commands
function precmd() {
  echo ""
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias python='python3'
alias cd='z'
alias ls='eza'
alias ll='eza -lh'
alias l='eza -lah'

export MANGOHUD=1
export MANGOHUD_DLSYM=1

# Created by `pipx` on 2023-08-22 06:59:49
export PATH="$PATH:/home/ethan/.local/bin"
export PATH="$PATH:/home/ethan/.pyenv/bin"
export PATH="$PATH:/home/ethan/.dotfiles/bin"
export PATH="$PATH:/Users/ethanbrady/.dotfiles/bin"
