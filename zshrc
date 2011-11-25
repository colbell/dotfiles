# -*- shell-script -*-

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="robbyrussell"
#export ZSH_THEME="humza"
#export ZSH_THEME="candy"
export ZSH_THEME="aussiegeek"

export LANG='en_AU.utf8'
export LC_CTYPE='en_AU.UTF-8'
#export LC_CTYPE=C

export MAIL=$HOME/Maildir/local
export MAILDIR=$HOME/Maildir/local

setopt hist_ignore_all_dups

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler git rails mysql ruby cap rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/colbell/bin:/home/colbell/.bin:/home/Android/sdk::/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

P() {
  echo $PATH | tr -s ':' '\n'
}

D()
{
  if [ $# -eq 0 ]; then
    z=0
    for i in `dirs`; do
      echo $z $i
      z=$((z+1))
    done
  elif [ $1 -gt 0 ]; then
    pushd +$1
  elif [ $1 -lt 0 ]; then
    z=$1
    popd +$((-z))
  else
    echo d: Broken
  fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
