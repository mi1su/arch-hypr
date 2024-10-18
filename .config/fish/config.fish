set fish_greeting ""

fish_config theme choose "Catppuccin Macchiato"

# alias ll="ls -l --color=auto"
# alias la="ls -A --color=auto"
# alias l="ls -CF --color=auto"

alias ls lsd
alias ll 'ls -hal'
alias lt 'ls --tree'

set -gx EDITOR nvim
set -gx KUBE_EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# Remove underline a path
set fish_color_valid_path nornal

starship init fish | source

if not pgrep -u $USER ssh-agent >/dev/null
    eval (ssh-agent -c)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

