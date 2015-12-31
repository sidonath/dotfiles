# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git rbenv alert smc gup)

# WARNING: this overwrites standard commands like ls
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias ports="sudo lsof -Pi | grep LISTEN | sed -E 's/ +/,/g' | cut -d ',' -f 1,2,3,9 | column -s',' -t"
alias fs="foreman start"
alias fr="foreman run"
#alias zeus="~/.rbenv/shims/foreman run zeus"
alias gff="git flow feature"
alias gfh="git flow hotfix"
alias gfr="git flow release"
alias tardis="git rbi master"

alias enslower="sudo ipfw add pipe 1 all from any to localhost && sudo ipfw pipe 1 config bw 300Kbit/s delay 200ms"
alias enfasten="sudo ipfw flush"

BREW_PATH=/usr/local/bin:/usr/local/sbin
PATH=./bin:$HOME/bin:$BREW_PATH:$PATH:/usr/local/mysql/bin

DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export EDITOR=vim

# Ruby (Rails) performance improvements
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=100000000
# export RUBY_HEAP_FREE_MIN=500000

export PGDATA=/usr/local/var/postgres

export LC_CTYPE=en_US.UTF-8

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Use Zsh/ZLE in vi-mode
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^N' menu-complete
bindkey '^P' reverse-menu-complete
export KEYTIMEOUT=1 # how long to wait after pressing modifier key (e.g. ESC)

INSERT_MODE_PROMPT="%{$fg_bold[yellow]%}-- INSERT --%{$reset_color%}"
RPS1=$INSERT_MODE_PROMPT

### Report ZLE/vi mode in prompt
# http://dougblack.io/words/zsh-vi-mode.html
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/$INSERT_MODE_PROMPT} $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Go work environmnet
export GOPATH=${HOME}/src/go/
export PATH="$PATH:$GOPATH/bin"

# Qt environment
export QT_TT_BUILD_PATH=$(brew --prefix qt5)
export PATH=$(brew --prefix qt5)/bin:$PATH

export MONO_GAC_PREFIX="/usr/local"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home

[ -s "/Users/damir/.dnx/dnvm/dnvm.sh" ] && . "/Users/damir/.dnx/dnvm/dnvm.sh" # Load dnvm
