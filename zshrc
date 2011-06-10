#! /bin/sh
######################################################################
#           bodhi.zazen's zshrc based on :
#
#
#           jdong's zshrc file v0.2.1 , based on:
#           mako's zshrc file, v0.1
#
#
######################################################################

# source common configurations
source /usr/local/share/config/term_colors
source /usr/local/share/config/aliases

# next lets set some enviromental/shell pref stuff up
# setopt NOHUP
#setopt NOTIFY
#setopt NO_FLOW_CONTROL
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
# setopt AUTO_LIST		# these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME		# tries to resume command of same name
# unsetopt BG_NICE		# do NOT nice bg commands
setopt CORRECT			# command CORRECTION
# setopt EXTENDED_HISTORY		# puts timestamps in the history
# setopt HASH_CMDS		# turns on hashing
#
setopt MENUCOMPLETE
setopt ALL_EXPORT

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile


# PATH="/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:$PATH"
PATH='/usr/kerberos/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/home/bodhi/bin'
# TZ="America/New_York"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
#PAGER='less'
PAGER='most'
EDITOR='emacs'
TERM='xterm-256color'

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"

# User specific aliases and functions

# Color
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
LIGHTYELLOW='\e[0;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color

# Set Prompt

PS1="$PR_LIGHT_GREEN%n$PR_GREY@$PR_BLUE%m$PR_GREY:$PR_LIGHT_RED%2c$PR_NO_COLOR%(!.#.$) "
# RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"
RPS1="$PR_LIGHT_YELLOW%D{%m/%d/%y %l:%M %p}$PR_NO_COLOR"
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

if [ $SSH_TTY ]; then
  MUTT_EDITOR=vim
else
  MUTT_EDITOR=emacsclient.emacs-snapshot
fi

unsetopt ALL_EXPORT
# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------

alias ls='ls -c --color=auto'
alias la='ls -ac --color=auto'
alias ll='ls -lh --color=auto'
alias lla='ls -lah --color=auto'
alias lsd='ls -d */'

# with grep
alias lsg='ls --color=auto | g'
alias lag='ls -a --color=auto | g'
alias llg='ls -lah --color=auto | g'

# Colorize grep
alias g="grep --color=always"
alias gi="grep -i --color=always"

# Confirm
# alias mv='mv -i'
# alias cp='cp -i'
# alias rm='rm -i'

# Override -f
alias rmf='rm -Rfv'
alias cpf='\cp -v'
alias mvf='\mv -v'
alias rmf='rm -Rfv'

# No colbber
set -o noclobber # Override >|

# Sysadmin
alias psa='ps auxf'
alias psg='ps aux | grep'  #requires an argument
# alias date='date "+%A %B %d, %Y %l:%M %p %Z"'
alias date='echo -ne "${LIGHTBLUE}";date "+%A %B %d, %Y %l:%M %p %Z"'
alias cal='echo -e "${CYAN}"; cal""'
alias hist='history | g $1' #Requires one input
alias du='du -sh'
alias dul='\du -h | less'
alias df='df -h'
alias nano='nano -w'
alias nanob='nano -w -B'

# Add ~/bin to $PATH (if it exists)
# IMO ~/bin should be last on the $PATH :)
if [ -d "$HOME/.bin" ]; then
  PATH="$PATH:$HOME/.bin"
fi
if [ -d "$HOME/bin" ]; then
  PATH="$PATH:$HOME/bin"
fi

# fun


################################
###       Functions          ###
################################

# Extract files from any archive
# Usage: ex <archive_name>

function ex ()
{
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar)                tar xvf $1        ;;
      *.tar.bz2 | *.tbz2 )  tar xjvf $1        ;;
      *.tar.gz | *.tgz )    tar xzvf $1     ;;
      *.bz2)                bunzip2 $1       ;;
      *.rar)                unrar x $1     ;;
      *.gz)                 gunzip $1     ;;
      *.zip)                unzip $1     ;;
      *.Z)                  uncompress $1  ;;
      *.7z)                 7z x $1    ;;
      *.xz)                 tar xJvf $1     ;;
      *)   echo ""${1}" cannot be extracted via extract()" ;;
     esac
   else
     echo ""${1}" is not a valid file"
   fi
}
# Modified by bodhi.zazen
# Thanks to rezza at Arch Linux

# The following enables scp :)
test "dumb" != $TERM && {
# Set title of terminal to host name and working directory
# add "set title" to your .vimrc and title will change to file name when vim is opened !
host=$(uname -n)
if [ "${TERM}" = "xterm" -o "${TERM}" = "xterm-color" ]
  then
 if [ -z "${BASH}" ]
  then
     echo "\033]2;${host}\007\033]1;${host}\007"
  else
     export PROMPT_COMMAND=\ 'echo -ne "\033]2;${host}:${PWD}\007\033]1;@${host}:${PWD}\007"'
 fi
fi

}

# Config xterm
# also need ~/.Xresources
if [ -e ~/.Xresources ] && [ ! -z "$DISPLAY" ]; then
  xrdb -merge .Xresources
fi


autoload -U compinit
compinit
bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
# zstyle ':completion:*:processes' command 'ps -au$USER'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#zstyle ':completion:*:processes' command 'ps ax -o pid,s,nice,stime,args | sed "/ps/d"'
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}')
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

source /usr/local/share/config/dhammapada
