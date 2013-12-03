# dotfiles

## Zsh

Uses oh-my-zsh, but I'm looking to get rid of it.

Zsh is running in vi mode and displays current mode (instert/normal) in the right prompt.

## Tmux

Tmux requires `reattach-to-user-namespace` to be installed so it can use system clipboard on Mac OS.

Install it with:

```
brew install reattach-to-user-namespace
```

## Vim

Vim is set to use system clipboard by default. Note that this doesn't work with the default build
of Vim provided with Mac OS, so either Vim needs to be recompiled
(`brew install vim --override-system-vi`) or MacVim in terminal mode (`mvim -v`) should be used.

### Plugins

Vim plugins are added as submodules and are loaded with pathogen.

* [abolish.vim](https://github.com/tpope/vim-abolish)

  Used for handy coercion tools (`crc`, `crs` etc.)

* [NERDTree](https://github.com/scrooloose/nerdtree)
* [NERDTreeTabs](https://github.com/jistr/vim-nerdtree-tabs)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [TComment](https://github.com/tomtom/tcomment_vim)
* [eunuch.vim](https://github.com/tpope/vim-eunuch)
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [CamelCaseMotion](https://github.com/bkad/CamelCaseMotion)
* [endwise.vim](https://github.com/tpope/vim-endwise)
* [surround.vim](https://github.com/tpope/vim-surround)
* [Vim Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)

Languages:

* [CoffeeScript](https://github.com/kchmck/vim-coffee-script)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [vim-rails](https://github.com/tpope/vim-rails)
* [vim-haml](https://github.com/chriseppstein/vim-haml)
* [vim-javascript](https://github.com/pangloss/vim-javascript)

Colors:

* [Solarized](https://github.com/altercation/vim-colors-solarized)
