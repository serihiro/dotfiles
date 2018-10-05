#G Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cypher"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler) 

source $ZSH/oh-my-zsh.sh

bindkey -e
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"export PATH="$HOME/bin:$PATH"

# Ruby
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Go
if [ -d $HOME/.goenv ]; then
  export GOENV_ROOT=$HOME/.goenv
  export GOPATH=$HOME/go
  export PATH="$GOENV_ROOT/bin:$GOPATH/bin:$PATH"
  eval "$(goenv init -)"
fi

# Java
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "10"`
export PATH=${PATH}:${JAVA_HOME}/bin
export EDITOR='vim'

# heroku toolbelt
if [ -d /usr/local/heroku ]; then
  export PATH=$PATH:/usr/local/heroku/bin
fi

# Android
if [ -d $HOME/Library/android-sdk-macosx ]; then
  export ANDROID_HOME=$HOME/Library/android-sdk-macosx
  export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi

# Node.js
if [ -d $HOME/.nodebrew ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  nodebrew use 9.8.0
fi

# to use brew openssl
if [ -d /usr/local/Cellar/openssl ]; then
  export PATH="/usr/local/Cellar/openssl/1.0.2l/bin:$PATH"
  export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -d $HOME/google-cloud-sdk ]; then
  source '~/google-cloud-sdk/path.zsh.inc'
  source '~/google-cloud-sdk/completion.zsh.inc'
fi

# embulk
if [ -d $HOME/.embulk ]; then
  export PATH="$HOME/.embulk/bin:$PATH"
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi
fi

# rustup
if [ -d $HOME/.cargo ]; then
  source $HOME/.cargo/env
fi

# OCaml
if [ -d $HOME/.opam ]; then
  . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
  alias ocaml="rlwrap ocaml"
fi

# Intel MKL
if [ -d /opt/intel ]; then
  export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/intel/lib
fi

# alias
alias ll='ls -la'
alias rake="noglob rake"
alias biv="bundle install --path=vendor/bundle --binstubs=vendor/ruby"
alias dce="docker-compose exec"
alias dcea="docker-compose exec api"
alias dcew="docker-compose exec web"
alias resettest="bin/rake db:drop db:create db:schema:load RAILS_ENV=test"
alias cp14="clang++ -std=c++14 -Wall"
alias cp11="clang++ -std=c++11 -Wall"
alias gsu="git fetch upstream && git merge upstream/master"

