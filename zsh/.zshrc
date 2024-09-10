# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"               # The path to the oh-my-zsh installation
ZSH_THEME="robbyrussell"                    # The theme set for oh-my-zsh
zstyle ':omz:update' mode auto              # update automatically without asking
plugins=(
    git
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh                    # Load oh-my-zsh

source <(fzf --zsh)

eval "$(zoxide init zsh)"                   # Load zoxide
eval "$(starship init zsh)"		    # Load starship

alias python='python3'                      # Use python3 as the default python
alias cd='z'                                # Use zoxide as the default cd
alias ls='eza'                              # Use eza as the default ls
alias ll='eza -lh'                          # ...
alias l='eza -lah'                          # ...
alias cat='bat'                             # Use bat as the default cat

export PATH="$PATH:/home/ethan/.local/bin"
export PATH="$PATH:/home/ethan/.pyenv/bin"
export PATH="$PATH:/usr/local/bin"

setopt HIST_EXPIRE_DUPS_FIRST               # Clean up duplicates in history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

temp() {
    cp -r "${HOME}/Temps/${1}" .
    echo "Successully created ${1}"
}

# bun completions
[ -s "/Users/ethanbrady/.bun/_bun" ] && source "/Users/ethanbrady/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
