export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

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
  nodebrew use 15.12.0
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -d $HOME/google-cloud-sdk ]; then
  source ${HOME}/google-cloud-sdk/path.zsh.inc
  source ${HOME}/google-cloud-sdk/completion.zsh.inc
fi

# embulk
if [ -d $HOME/.embulk ]; then
  export PATH="$HOME/.embulk/bin:$PATH"
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# rustup
if [ -d $HOME/.cargo ]; then
  source $HOME/.cargo/env
  export RUSTC_WRAPPER=$(which sccache)
fi

# OCaml
if [ -d $HOME/.opam ]; then
  . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
  alias ocaml="rlwrap ocaml"
fi

# Intel MKL
if [ -d /opt/intel ]; then
  export DYLD_LIBRARY_PATH="/opt/intel/lib/intel64:/opt/intel/lib:/opt/intel/mkl/lib:$DYLD_LIBRARY_PATH"
fi

# CUDA PATH
if [ -d /Developer/NVIDIA ]; then
  CUDA_HOME=/Developer/NVIDIA/CUDA-9.2
  PATH="$CUDA_HOME/bin:$PATH"
fi

# stack
export PATH="$HOME/.local/bin:$PATH"

PLATFORM=`uname`
if [ "${PLATFORM}" = "Darwin" ];then
  alias ls='ls -G'
elif [ "${PLATFORM}" = "Linux" ];then
  alias ls='ls --color=auto'
fi

# alias
alias ll='ls -la'
alias rake="noglob rake"
alias biv="bundle config set path 'vendor/bundle';bundle install;"
alias dce="docker compose exec"
alias dcea="docker compose exec api"
alias dcew="docker compose exec web"
alias resettest="bin/rake db:drop db:create db:schema:load RAILS_ENV=test"
alias cp17="clang++ -std=c++17 -stdlib=libc++ -Wall -O2"
alias gp17="g++-11 -std=gnu++17 -Wall -Wextra -O2"
alias gsu="git fetch upstream && git merge upstream/master"
alias c11="gcc-11 -std=c11 -Wall -Wextra -O2"
alias ojt="oj t --ignore-spaces-and-newline"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

if [ -d /usr/local/bin/direnv ]; then
  eval "$(direnv hook zsh)"
fi
