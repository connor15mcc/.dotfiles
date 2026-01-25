# git clone --bare git@github.com:connor15mcc/.dotfiles .dotfiles

export PATH=$HOME/.local/bin:$PATH

# Download Zinit, if it's not there yet
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && \
    GIT_CONFIG_GLOBAL=/dev/null \
    GIT_CONFIG_SYSTEM=/dev/null \
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice wait"0" lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait"0" lucid atinit"export ZSH_AUTOSUGGEST_STRATEGY=(history completion);
                               export ZSH_AUTOSUGGEST_HISTORY_IGNORE='cd*';
                               bindkey '^K' autosuggest-accept
                               bindkey '^J' autosuggest-clear
                               bindkey '^P' up-line-or-search
                               bindkey '^N' down-line-or-search"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" lucid
zinit snippet OMZP::git
zinit ice wait"0" lucid
zinit snippet OMZL::git.zsh

zinit ice wait"0" lucid
zinit ice atinit"zstyle :omz:plugins:ssh-agent identities id_ed25519"
zinit snippet OMZP::ssh-agent

zinit ice atinit"VI_MODE_SET_CURSOR=true"
zinit snippet OMZP::vi-mode

zinit load atuinsh/atuin

## oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/config.yaml)"
## /oh-my-posh

# for managing dotfiles...
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# set vim as default editor
alias vim='nvim'
bindkey -v

# expand globs (unsure if this is the best way?)
setopt no_nomatch
# append to history files immediately (for `yank`)
HISTFILE=~/.zsh_history
SAVEHIST=1000
setopt inc_append_history

alias gab='git absorb'
alias gdecay='git log --pretty=format:"%ad" --date=iso | tools decay'
alias gcontrib='git log --pretty=format:"%an" | sort | uniq -c | sort -r'

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# ls after cd
function chpwd() {
        emulate -L zsh
        ls
}
# name zellij tabs
if [[ -n $ZELLIJ ]]; then
    precmd() {
        # Rename the pane to current directory
        command nohup zellij action rename-pane "$(basename "$PWD")" >/dev/null 2>&1
        # Rename the tab to match the focused pane
        command nohup zellij action rename-tab "$(basename "$PWD")" >/dev/null 2>&1
    }
fi

alias medit='fd manifest.yaml -X nvim'

# venv wrapper to automatically activate after setup
function venv() {
  command venv "$@"
  if [ -f venv/bin/activate ]; then
    source venv/bin/activate
  fi
}
