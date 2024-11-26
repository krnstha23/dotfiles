# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$PATH:/home/goku/.dotnet/tools"

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

function ip() {
  echo "sh $(grep -A 1 -i "$1" ~/ip.txt | tail -n 1)"
}

# Helpful aliases
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -

alias  n='nvim'
alias  nf='nvim $(fzf --preview="bat --color=always {}")'
alias  dwrun='dotnet watch run'
alias  drun='dotnet run'
alias  db='dotnet build'
alias  dc='dotnet clean'
alias  sh='kitten ssh -i ~/.ssh/id_rsa_kiran'
alias  sp='scp -i ~/.ssh/id_rsa_kiran'
alias  templ='/home/goku/go/bin/templ'
alias tm='tmux new -s `basename $PWD`'
alias rf='redis-cli flushall'

# Handy change dir shortcuts
alias ..='z ..'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'
alias air='$(go env GOPATH)/bin/air'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6

eval `ssh-agent -s`
ssh-add ~/.ssh/id_github

eval "$(zoxide init zsh)"

# Flutter Setup By AR Rahman(Heartless)
export PATH="$PATH:$HOME/Android/flutter/bin"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_TOOLS="$HOME/Android/Sdk/cmdline-tools/latest"
export ANDROID_PLATFORM_TOOLS="$HOME/Android/Sdk/platform-tools"
PATH="$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS"
# Chrome Setup
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

