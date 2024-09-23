#
#      ▌     
#  ▀▌▛▘▛▌▛▘▛▘
#▗ ▙▖▄▌▌▌▌ ▙▖
#
# Lines configured by compinstall
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/vince/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# graphical password prompt
export SUDO_ASKPASS="/home/vince/askpass"

# set editor to neovim
export EDITOR=nvim

# QT
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_SCALE_FACTOR=0.8
#export QT_ENABLE_HIGHDPI_SCALING=1
#export QT_USE_PHYSICAL_DPI=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export QT_STYLE_OVERRIDE=kvantum

# electron
export ELECTRON_OZONE_PLATFORM_HINT=auto

# laptop (hidpi)
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.8
export LANG=en_US.UTF-8
export GDK_BACKEND=wayland

# pager
export PAGER=less

# avoid loading nvidia modules
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json

# NVK does not yet support Pascal gpus
export NVK_I_WANT_A_BROKEN_VULKAN_DRIVER=1

# firefox
export MOZ_ENABLE_WAYLAND=1
#export GTK_USE_PORTAL=1

# libreoffice
export SAL_USE_VCLPLUGIN=qt6

# krita (use kvantum theme)
export KRITA_NO_STYLE_OVERRIDE=1

# dotfiles repo
export DOT=$HOME/.dotfiles

# aliases
source $HOME/.zsh_aliases 

########
# PROMPT
## Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '['$branch']'
  fi
}

setopt prompt_subst

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='┌ %B%n@%m%b %F{5}%D %T%f %S$(git_branch_name)%s
└ %F{179}%~%f %B%#%b '
RPROMPT='
${return_code}'

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

# path
export PATH=$PATH:$GEM_HOME/bin:/home/vince/.local/bin

# caniuse completion
. <(caniuse --completion)
