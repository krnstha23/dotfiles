#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set PS1 with red Git info
PS1='\w\[\e[32m\]$(parse_git_branch)\[\e[00m\] 💤   \n   '

gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps','caps:escape']"

alias  c='clear'
alias  n='nvim'
alias  nf='nvim $(fzf --preview="bat --color=always {}")'
alias  dwrun='dotnet watch run'
alias  drun='dotnet run'
alias  db='dotnet build'
alias  dc='dotnet clean'
alias tm='tmux new -s `basename $PWD`'
alias rf='redis-cli flushall'

alias sh='ssh -i ~/.ssh/id_rsa_kiran'
alias sp='scp -i ~/.ssh/id_rsa_kiran'

function ip() {
  cmd=$(grep -A 1 -i "$1" ~/ip.txt | tail -n 1)
  echo "sh $cmd"   # Optional: to show the command
  sh "$cmd"
}

# Handy change dir shortcuts
alias ..='z ..'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'
alias mkdir='mkdir -p'

export PATH="$PATH:/home/goku/.dotnet/tools"

eval "$(zoxide init bash)"
