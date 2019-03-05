# mgh87 config file for zsh
# based on hschne.at/ configuration

# Antigen
# 
# Antigen is plugin manager of ZSH. 
#
# Website: http://antigen.sharats.me/
source ~/antigen/antigen.zsh

# Oh-my-Zsh
#
# The original ZSH plugin manager. 
#
# Website: https://ohmyz.sh/
antigen use oh-my-zsh

# Plugins for oh-my-zsh
#
# Various plugins for different things, add aliases, auto-completions and stuff 
# like that.
#
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
# antigen bundle ubuntu
antigen bundle archlinux
antigen bundle aws
# antigen bundle gitfast # might worth consideration
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle mvn
antigen bundle node
antigen bundle npm
antigen bundle pass # checkout https://www.passwordstore.org/ and use it instead of lastpass?

# Enable vi-mode
#
# Allows you to havigate your shell with vim-like keybindings and feel like a wizard
# while doing it.
#
# See https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh
#antigen bundle vi-mode

# Syntax Highlighting and Autosuggestions
#
# Does what it says on the tin. See site for more information.
#
# Website: https://github.com/zsh-users
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Spaceship theme
#
# The nicest prompt theme I could find. Adds wonderful git support, 
# supports vi-mode and much more.
#
# Website: https://denysdovhan.com/spaceship-prompt/
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

antigen apply

# History Tweaks 
#
# The main idea here is to avoid having a bunch of duplicates.
# Additionally, the history size is increased. 
#
# See http://zsh.sourceforge.net/Doc/Release/Options.html
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
HISTSIZE=10000

# Disable Scroll Lock 
#
# Needed to be able to do CTRL-S in vim in the terminal. 
#
# See https://unix.stackexchange.com/a/72092
#stty -ixon

# Fix new Tab on Arch
#
# When opening a new Tab in Gnome Terminal, it always opens in $HOME. 
# Only applies to Arch distros.
#
# For the bugreport see https://bugs.launchpad.net/ubuntu-gnome/+bug/1193993 
# For fixes see  https://unix.stackexchange.com/questions/93476/gnome-terminal-keep-track-of-directory-in-new-tab
#if [ -f "/etc/arch-release" ]; then
#  . /etc/profile.d/vte.sh
#fi

# Speed up prompt redraw, useful when using vi-mode 
#export KEYTIMEOUT=1

# Add custom aliases
source $HOME/.aliases

# Add custom scripts
export PATH="$HOME/.scripts:$PATH"

# Homeshick
#
# Homeshick is a dotfile manager written in Bash. Useful for 
# keeping your settings backed up.
#
# Website: https://github.com/andsens/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
homeshick --quiet refresh 2


# NVM
#
# The node version manager. 
#
# Website: https://github.com/creationix/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# jEnv
#
# A version manager for Java. 
#
# Website: http://www.jenv.be/
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# The Fuck
#
# The most magnificent thing you will ever see. Semantically correct
# way of dealing with typos.
#
# Website: https://github.com/nvbn/thefuck
#eval $(thefuck --alias)

# FZF
#
# FZF is a fuzzy command line finder. Great for finding files
# and traversing your history.
#
# Website: https://github.com/junegunn/fzf
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=vim

# Ruby config
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# Replace agents
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
gpg-connect-agent updatestartuptty /bye

# GPG key id
export KEYID=5686D0EBC96E9B54CC5F3367B198DAAB514B53CF

# Initialize autocompletion
# Not working...
# compinit
