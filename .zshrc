# git clone --bare git@github.com:connor15mcc/.dotfiles .dotfiles

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
                               bindkey '^I' autosuggest-accept"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" lucid
zinit snippet OMZP::git
zinit ice wait"0" lucid
zinit snippet OMZL::git.zsh

zinit ice atinit"VI_MODE_SET_CURSOR=true"
zinit snippet OMZP::vi-mode
## /zinit

## oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/omp/config.json)"
## /oh-my-posh

# for managing dotfiles...
	# git init --bare $HOME/.dotfiles
	# alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' (add this alias to .bashrc)
	# exec zsh
	# config config --local status.showUntrackedFiles no
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
# set vim as default editor
export EDITOR=nvim
bindkey -v

# expand globs (unsure if this is the best way?)
setopt no_nomatch

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

# ruby
eval "$(rbenv init - zsh)"

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
