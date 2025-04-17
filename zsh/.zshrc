# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
   ssh-add ~/.ssh/id_rsa_kiran 2>/dev/null
   ssh-add ~/.ssh/git 2>/dev/null
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/goku/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias  c='clear'
alias  n='nvim'
alias  nf='nvim $(fzf --preview="bat --color=always {}")'
alias  dwrun='dotnet watch run'
alias  drun='dotnet run'
alias  db='dotnet build'
alias  dc='dotnet clean'
alias tm='tmux new -s `basename $PWD`'
alias rf='redis-cli flushall'

function ip() {
  cmd=$(grep -A 1 -i "$1" ~/ip.txt | tail -n 1)
  echo "ssh $cmd"   # Optional: to show the command
  ssh "$cmd"
}

# Handy change dir shortcuts
alias ..='z ..'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'
alias mkdir='mkdir -p'

export PATH="$PATH:/home/goku/.dotnet/tools"

source ~/powerlevel10k/powerlevel10k.zsh-theme

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
