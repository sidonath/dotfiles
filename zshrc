DOTFILES=$HOME/.dotfiles

# robbyrussel oh-my-zsh theme
OMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git rbenv alert smc gup)

# WARNING: this overwrites standard commands like ls
PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

alias ports="sudo lsof -Pi | grep LISTEN | sed -E 's/ +/,/g' | cut -d ',' -f 1,2,3,9 | column -s',' -t"
alias fs="foreman start"
alias fr="foreman run"
alias gff="git flow feature"
alias tardis="git rbi master"

alias enslower="sudo ipfw add pipe 1 all from any to localhost && sudo ipfw pipe 1 config bw 300Kbit/s delay 200ms"
alias enfasten="sudo ipfw flush"

BREW_PATH=/usr/local/bin:/usr/local/sbin
PATH=./bin:$HOME/bin:$BREW_PATH:$PATH:/usr/local/mysql/bin

DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export EDITOR=vim

# Ruby (Rails) performance improvements
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

export PGDATA=/usr/local/var/postgres

export LC_CTYPE=en_US.UTF-8

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source $DOTFILES/zsh/**/*.zsh
