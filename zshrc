# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nanotech"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sprunge)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
# Check /etc/zsh/zshrc for system defaults.

# augment PATH with my personal bin/ folder
export PATH=$PATH:/home/cgg/bin
export PATH=/home/cgg/.local/bin:$PATH
export PATH=$PATH:/home/cgg/Private/common/git
export PATH=$PATH:/home/cgg/.gem/ruby/1.9.1/bin

# some useful aliases

alias la='ls -la'
alias make='make -j8'
alias gitka='gitk --all'
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet .ssh/id_rsa) && ssh'

# to use ccache
export PATH="/usr/lib/ccache/bin/:$PATH"
export PATH="/usr/lib/colorgcc/bin/:$PATH"    # As per usual colorgcc installation, leave unchanged (don't add ccache)
export CCACHE_PATH="/usr/bin"                 # Tell ccache to only use compilers here

# git stuff
export GIT_AUTHOR_NAME="`git config user.name`"
export GIT_AUTHOR_EMAIL=`git config user.email`

fortune-prompt.sh
