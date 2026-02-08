# Completion must run BEFORE instant prompt (compinit does I/O; instant prompt redirects it).
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches --%f'
zstyle ':completion:*' rehash true

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh configuration

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e

# Aliases - basic
alias grep='grep --color=auto'

# File system (omarchy-style eza)
if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
else
  alias ls='ls --color=auto'
fi

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias c='clear'
alias n='nvim'
alias nf='nvim $(fzf --preview="bat --color=always {}")'

# Aliases - tools
alias tm='tmux new -s `basename $PWD`'
alias ca='cursor-agent'

# Handy change dir shortcuts (using zoxide)
alias ..='z ..'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'
alias mkdir='mkdir -p'

# Initialize zoxide (smart cd)
eval "$(zoxide init zsh)"

# fzf integration (keybindings: Ctrl+R history, Ctrl+T files, Alt+C cd)
if command -v fzf &> /dev/null; then
  if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
  fi
  if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
  fi
fi

# Local-only aliases and secrets (not in repo): create ~/.zshrc.local and add things like:
#   alias ndql='psql "postgresql://user:password@host:5432/dbname?sslmode=require"'
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
