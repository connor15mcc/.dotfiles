# git clone --bare git@github.com:connor15mcc/.dotfiles .dotfiles

export PATH=$HOME/.local/bin:$PATH

eval "$(mise activate zsh)"

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
setopt interactivecomments
setopt prompt_subst # enable command substition in prompt
(( $+functions[add-zsh-hook] )) || autoload -Uz add-zsh-hook

function prompt_lite_cmd() { oh-my-posh print primary --config ~/.config/omp/config.lite.yaml }
function prompt_full_cmd() { oh-my-posh print primary --config ~/.config/omp/config.full.yaml }
PROMPT='$(prompt_lite_cmd)' # single quotes to prevent immediate execution
ASYNC_PROC=0
function async_prompt() {
    function async() {
        printf "%s" "$(prompt_full_cmd)" > "/tmp/zsh_prompt_$$"
        sleep 0.1
        kill -s USR1 $$
    }

    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi

    async &!
    ASYNC_PROC=$!
}
add-zsh-hook precmd async_prompt

function TRAPUSR1() {
    # read from temp file
    PROMPT="$(cat /tmp/zsh_prompt_$$)"
    # remove the temp file
    rm /tmp/zsh_prompt_$$

    # reset proc number
    ASYNC_PROC=0

    # redisplay
    zle && zle reset-prompt

    # prepare for next
    PROMPT='$(prompt_lite_cmd)'
}

function set_poshcontext() {
    export POSH_JJ_SEGMENT=$(
        if jj root >/dev/null 2>&1; then echo -n ''; fi
        jj --ignore-working-copy log -r @ --no-graph -T 'change_id.shortest() ++ " " ++ description.first_line()' 2>/dev/null;
        echo "foo"
    )
}
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

function ls_after_cd() {
    emulate -L zsh
    ls
}
add-zsh-hook chpwd ls_after_cd

function zellij_tab_naming() {
    if [[ -n $ZELLIJ ]]; then
        command nohup zellij action rename-pane "$(basename "$PWD")" >/dev/null 2>&1
        command nohup zellij action rename-tab "$(basename "$PWD")" >/dev/null 2>&1
    fi
}
add-zsh-hook precmd zellij_tab_naming

alias medit='fd manifest.yaml -X nvim'

# venv wrapper to automatically activate after setup
function venv() {
  command venv "$@"
  if [ -f venv/bin/activate ]; then
    source venv/bin/activate
  fi
}
