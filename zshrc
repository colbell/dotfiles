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

#export LC_ALL='en_AU.UTF-8'
#export LANG='en_AU.utf8'
#export LC_CTYPE='en_AU.UTF-8'
#export LC_CTYPE=C

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
plugins=(bundler git rails git-flow mysql ruby rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/home/cbell/bin:/home/cbell/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

PATH() {
  echo $PATH | tr -s ':' '\n'
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
