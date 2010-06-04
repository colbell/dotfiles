# -*- conf -*-

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    if [ -d "$HOME/bin/gittools/bin" ] ; then
      PATH="$HOME/bin/gittools/bin:$PATH"
    fi
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes local private bin if it exists
if [ -d "$HOME/localbin" ] ; then
    PATH="$HOME/localbin:$PATH"
fi

if [ -d "/var/lib/gems/1.8/bin" ] ; then
   export PATH=$PATH:"/var/lib/gems/1.8/bin"
fi
