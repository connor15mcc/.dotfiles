# dismiss default greeting
set -g fish_greeting
# enable transient prompts
set -g fish_transient_prompt 1

fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin
fish_add_path -g $HOME/.cargo/bin
fish_add_path $HOME/.local/share/mise/shims

fish_vi_key_bindings
# <C-k> for accept; <C-n>, <C-p> to scroll
bind --mode insert ctrl-k accept-autosuggestion
bind --mode insert ctrl-n down-or-search
bind --mode insert ctrl-p up-or-search
# launch vim with buffer from normal mode
bind V edit_command_buffer
bind v,v edit_command_buffer
# substitute last command with `!!`
bind --mode insert !,! bang_bang

mise activate fish | source
atuin init fish | source
zoxide init fish --cmd cd | source
