# -*- shell-script -*-

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    if [ -d "$HOME/.bin/gittools/bin" ] ; then
      PATH="$HOME/.bin/gittools/bin:$PATH"
    fi
    PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#if [ ! -h $HOME/.config/awesome/themes ]
#then
# /bin/ln -sn /usr/share/awesome/themes $HOME/.config/awesome/themes
#fi

#if [ ! -h $HOME/.config/awesome/current_theme ]
#then
# /bin/ln -sn /usr/share/awesome/themes/zenix $HOME/.config/awesome/current_theme
#fi

#export XDG_MENU_PREFIX='lxde-'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by `npm i local-bin-path`
export PATH=${PATH}:./node_modules/.bin
