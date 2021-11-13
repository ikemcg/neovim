# ikemcg's neovim config files

Herein lie my neovim config files.  Plugins are installed/updated with vim-plug
I use vim-coc for LSP, and vim-ale for linting and code fixing

## Installation

### Clone to `~/.config/nvim`

```bash
git clone git@github.com:ikemcg/neovim.git ~/.config/nvim
```

### Install vim-plug for neovim

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \                                                                          Isaacs-MacBook  10:58 
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run `:PlugInstall` from within vim to install the plugins

### Install PHP Codeniffer for PHP linting

Make sure you have the composer bin dir in your PATH. The default value is `~/.composer/vendor/bin/`

```
composer global require "squizlabs/php_codesniffer=*"
```

### Eslint for JS linting

The ALE (Asynchronous Lint Engine) plugin uses eslint for JavaScript linting.  I add eslint as a development
dependency on my projects, but I also like to install it sytem-wide with the following:

```
sudo npm install -g eslint
```

### Install Fuzzy Finder for better CtrP like functionality

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Install CoC (Conquer of Completion) extensions

```vim
:CocInstall coc-snippets
:CocInstall coc-tsserver
:CocInstall coc-phpls
```
