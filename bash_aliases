# -*- conf -*-

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  eval `dircolors -b`
  alias ls='ls --color=auto'
  #alias dir='ls --color=auto --format=vertical'
  #alias vdir='ls --color=auto --format=long'
fi

# alias whence='type -a'                        # where, of a sort

alias h='history'

# some more ls aliases
alias ll='ls -lFh'
alias la='ls -AFh'
alias l='ls -CFh'
alias lla='ls -lFha'

# Show subdirectories (dnf includes hidden subdirectories)
alias dn='OPTIONS=$(ls -F |grep /$) ; select s in $OPTIONS; do cd $PWD/$s ; break ; done '
alias dnf='OPTIONS=$(ls -aF |grep /$) ; select s in $OPTIONS; do cd $PWD/$s ; break ; done '

alias PATH='echo $PATH | tr ":" "\n"'

# Don't attach to X server when vim starts. Speeds up but
# lose clipboard access
#alias vim='vim -X'

#alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf'


# Standard screen sessions
#alias screen-office='screen -DR -c ~/.screen/office -S office'
#alias screen-ephyra='screen -DR -c ~/.screen/ephyra -S ephyra'

alias grep='grep --color=auto'

#alias ec=emacsclient
#alias ect='emacsclient -t'
#alias ecx='emacsclient -c'

alias em='emacs -nw'
