# git clone --bare git@github.com:connor15mcc/.dotfiles .dotfiles

export PATH=$HOME/.local/bin:$PATH

# zmodload zsh/zprof

## zinit
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
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
## /zinit

## oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/config.yaml)"
## /oh-my-posh

# for managing dotfiles...
	# git init --bare $HOME/.dotfiles
	# alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' (add this alias to .bashrc)
	# exec zsh
	# config config --local status.showUntrackedFiles no
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# set vim as default editor
export EDITOR=nvim
alias vim='nvim'
bindkey -v

# expand globs (unsure if this is the best way?)
setopt no_nomatch
# append to history files immediately (for `yank`)
HISTFILE=~/.zsh_history
SAVEHIST=1000
setopt inc_append_history

export JJ_CONFIG=~/.config/jj/config.toml
alias gab='git absorb'
alias gdecay='git log --pretty=format:"%ad" --date=iso | tools decay'
alias gcontrib='git log --pretty=format:"%an" | sort | uniq -c | sort -r'

alias goose='aws-okta exec -- goose'

# bun completions
[ -s "/home/cjmcc/.bun/_bun" ] && source "/home/cjmcc/.bun/_bun"
#
# bun
export BUN_INSTALL="$HOME/.bun"
PATH=$BUN_INSTALL/bin:$PATH

# go
PATH=$HOME/go/bin:$PATH

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

### lyft_localdevtools_shell_rc start
### DO NOT REMOVE: automatically installed as part of Lyft local dev tool setup
if [[ -f "/opt/homebrew/Library/Taps/lyft/homebrew-localdevtools/scripts/shell_rc.sh" ]]; then
    source "/opt/homebrew/Library/Taps/lyft/homebrew-localdevtools/scripts/shell_rc.sh"
fi
### lyft_localdevtools_shell_rc end

### DO NOT REMOVE: automatically installed as part of Lyft local dev tool setup
# eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
# eval "$(jenv init -)"

PATH="/Users/connormccarthy/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/connormccarthy/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/connormccarthy/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/connormccarthy/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/connormccarthy/perl5"; export PERL_MM_OPT;

# zprof

### lyft_rd_shell_rc start
### DO NOT REMOVE: automatically installed as part of Rancher Desktop setup
if [[ -f /Users/connormccarthy/.rd/shell_rc.sh ]]; then
  source /Users/connormccarthy/.rd/shell_rc.sh
fi
### lyft_rd_shell_rc end
#

export PATH="$PATH:/Users/connormccarthy/projects/screenpipe/target/debug"
export LIBCLANG_PATH="/home/cjmcc/.rustup/toolchains/esp/xtensa-esp32-elf-clang/esp-19.1.2_20250225/esp-clang/lib"
export PATH="/home/cjmcc/.rustup/toolchains/esp/xtensa-esp-elf/esp-14.2.0_20240906/xtensa-esp-elf/bin:$PATH"
