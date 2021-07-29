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
plugins=(git alert smc gup vim-mode git-fzf)
# plugins=(git alert smc gup git-fzf zsh-vi-mode)
# ZVM_CURSOR_STYLE_ENABLED=false
# ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
# zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# git-fzf binds ^g^(something) sequence, but vim-mode binds ^g making git-fzf bindings unusable
bindkey -r '^g'

# WARNING: this overwrites standard commands like ls
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias ports="sudo lsof -Pi | grep LISTEN | sed -E 's/ +/,/g' | cut -d ',' -f 1,2,3,9 | column -s',' -t"
#alias zeus="~/.rbenv/shims/foreman run zeus"
alias gff="git flow feature"
alias gfh="git flow hotfix"
alias gfr="git flow release"
alias tardis="git rbi main --autosquash"

alias enslower="sudo ipfw add pipe 1 all from any to localhost && sudo ipfw pipe 1 config bw 300Kbit/s delay 200ms"
alias enfasten="sudo ipfw flush"

BREW_PATH=/usr/local/bin:/usr/local/sbin
PATH=$BREW_PATH:$PATH:/usr/local/mysql/bin

DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export EDITOR=vim

# Ruby (Rails) performance improvements
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=100000000
# export RUBY_HEAP_FREE_MIN=500000

export PGDATA=/usr/local/var/postgres

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

## Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

INSERT_MODE_PROMPT="%{$fg_bold[yellow]%}-- INSERT --%{$reset_color%}"
RPS1=$INSERT_MODE_PROMPT
# TOUCH_BAR_STATUS=\[$(~/.iterm2/it2setkeylabel set status "$(test -d .git && (git rev-parse --abbrev-ref HEAD) || (echo -n "Not a repo"))")\]
# PS1=$PS1$TOUCH_BAR_STATUS

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

# Load rbenv
eval "$(rbenv init -)"
PATH=$HOME/bin:$PATH

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# dev env-specific
export TOPTAL_CHECK_ELASTICSEARCH_TEST_NODE=start

alias fs="tmux new-window \"grep --invert-match '#' < Procfile.dev | sed -e 's/^[^:]*: //' | xargs -I {} tmux split-window -h \; send-keys '{}' 'C-m' && tmux select-pane -t 1 \; select-layout even-horizontal\""
alias deploy-monitor="tmux new-window 'watch heroku ps -r production'; tmux split-window -h; tmux split-window 'watch curl https://version:8f48ac45106c1a7bd8cd9b2ab6362b21@freedom.to/deployed_version'; tmux split-window -t0 -p40 'watch heroku releases -r production'; tmux select-pane -t2"
alias dev-layout="tmux split-window; tmux split-window -h; tmux select-pane -t1; tmux select-pane -t0; vim"

# Globally disable correct prompts. Frakking freedom
unsetopt correct_all

# Use `fd` to teach FZF to respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/damir/.travis/travis.sh ] && source /Users/damir/.travis/travis.sh

# Python3 bins
export PATH=/usr/local/opt/python/libexec/bin:/Users/damir/Library/Python/3.8/bin:$PATH
