export ZSH="$HOME/.oh-my-zsh"               # The path to the oh-my-zsh installation
ZSH_THEME="robbyrussell"                    # The theme set for oh-my-zsh
zstyle ':omz:update' mode auto              # update automatically without asking
ENABLE_CORRECTION="true"                    # Enable correction feature

plugins=(
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh                    # Load oh-my-zsh
eval "$(zoxide init zsh)"                   # Load zoxide

function precmd() {echo ""}                 # Add a newline before each prompt

alias python='python3'                      # Use python3 as the default python
alias cd='z'                                # Use zoxide as the default cd
alias ls='eza'                              # Use eza as the default ls
alias ll='eza -lh'                          # ...
alias l='eza -lah'                          # ...
alias cat='bat'                             # Use bat as the default cat

export PATH="$PATH:/home/ethan/.local/bin"  # Add local bin to the path 
export PATH="$PATH:/home/ethan/.pyenv/bin"  # Add pyenv to the path
