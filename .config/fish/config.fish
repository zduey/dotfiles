# enable starship prompt
starship init fish | source

# Load rbenv automatically
status --is-interactive; and rbenv init - fish | source

# Load pyenv automatically
pyenv init - | source
