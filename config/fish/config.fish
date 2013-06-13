set -U __fish_git_prompt_showdirtystate 'yes'
set -U __fish_git_prompt_showstashstate 'yes'
set -U __fish_git_prompt_showupstream 'yes'
set -U __fish_git_prompt_color_branch yellow

set -U __fish_git_prompt_char_dirtystate '⚡'
set -U __fish_git_prompt_char_stagedstate '→'
set -U __fish_git_prompt_char_stashstate '↩'
set -U __fish_git_prompt_char_upstream_ahead '↑'
set -U __fish_git_prompt_char_upstream_behind '↓'

set -x TERM xterm-256color

# make less more friendly for non-text input files, see lesspipe(1)
if test -x "/usr/bin/lesspipe"
  set -x LESSOPEN "| lesspipe %s"
end

set -x LESS ' -R -X'
set -x PAGER 'less -i'

# Enable coloured man pages
# set LESS_TERMCAP_mb '\e[01;31m'
# set LESS_TERMCAP_md '\e[01;31m'
# set LESS_TERMCAP_me '\e[0m'
# set LESS_TERMCAP_se '\e[0m'
# set LESS_TERMCAP_so '\e[01;44;33m'
# set LESS_TERMCAP_ue '\e[0m'
# set LESS_TERMCAP_us '\e[01;32m'

set -x MANWIDTH 96

set -x EDITOR emacsclient

if test -d "/usr/local/heroku/bin"
  set PATH /usr/local/heroku/bin $PATH
end

if test -d "$HOME/bin"
  set PATH $HOME/bin $PATH
end
