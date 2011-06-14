# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="robbyrussell"
export ZSH_THEME="aussiegeek"

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
plugins=(bundler git rails ruby rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/home/cbell/bin:/home/cbell/.bin:/home/cbell/.rvm/gems/ree-1.8.7-2011.03@std/bin:/home/cbell/.rvm/gems/ree-1.8.7-2011.03@global/bin:/home/cbell/.rvm/rubies/ree-1.8.7-2011.03/bin:/home/cbell/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
