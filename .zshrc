# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh_theme p10k
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
# enable vi-style editing
# https://github.com/jeffreytse/zsh-vi-mode
  zsh-vi-mode
# enable fish-style autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
  zsh-autosuggestions
# enable syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
  zsh-syntax-highlighting 
)

[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && autoload -U compinit && compinit -u

source $ZSH/oh-my-zsh.sh

# for managing dotfiles...
	# git init --bare $HOME/.dotfiles
	# alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' (add this alias to .bashrc)
	# exec zsh
	# config config --local status.showUntrackedFiles no
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias v='nvim'
# set vim as default editor
export EDITOR=nvim

# ls after cd
function chpwd() {
	emulate -L zsh
	ls
}

# expand globs (unsure if this is the best way?)
setopt no_nomatch

# tab to accept autocomplete suggestion:
zvm_bindkey viins '^I' autosuggest-accept
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd*"

# to customize p10k prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.lyftrc
