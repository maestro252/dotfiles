# ==========================================
# Oh My Zsh Configuration
# ==========================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git python zsh-syntax-highlighting virtualenv ruby)
#zsh-auto-suggestions

source $ZSH/oh-my-zsh.sh

# ==========================================
# Environment Variables
# ==========================================
export EDITOR=nvim
export VISUAL=nvim
export TERM=xterm-256color
export JULIA_COPY_STACKS=1
export JAVA_HOME="/home/jony/.sdkman/candidates/java/current/"
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export PYSPARK_PYTHON=/usr/bin/python3
export PATH=$PATH:/usr/local/go/bin

# ==========================================
# Path Configuration
# ==========================================
export PATH="$PATH:/home/jony/packages/julia-1.10.0/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"
export PATH="$PATH:$HOME/.tmux/plugins/tmuxifier/bin"

# ==========================================
# Tool Environment Setup
# ==========================================
. "$HOME/.local/bin/env" # for uv
. "$HOME/.atuin/bin/env"
. "/home/jony/.deno/env"

# ==========================================
# SDKMAN Configuration
# ==========================================
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ==========================================
# Aliases
# ==========================================
alias lvim="/home/jony/.local/bin/lvim"
alias activate="source .venv/bin/activate"
alias weather="curl wttr.in"
alias neovide="neovide --size 1920x990 --wsl"
alias ls="eza --icons=always"

# ==========================================
# Tool Initialization
# ==========================================
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(tmuxifier init -)"
# eval "$(tmuxifier load-session jony)"
eval "$(~/.local/bin/mise activate)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/jony/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/tokyonight-storm.omp.json)"
