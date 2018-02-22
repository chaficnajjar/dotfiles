# dotfiles

A collection of dot configurations for my [Lenovo T450s](http://shop.lenovo.com/gb/en/laptops/thinkpad/t-series/t450s/) running [Arch Linux](https://www.archlinux.org/).

## Prerequisites

Install:

- Git
- Neovim
- Zsh
- Oh My Zsh

## Installation

### Clone the repo

`git clone https://github.com/chaficnajjar/dotfiles.git ~/dotfiles/public`

### Create symlinks

`./install`

### Fetch submodules

`git submodule update --init --recursive`

### Pull latest commits of all submodules

`git submodule update --remote --recursive`

### Add a Neovim plugin

To add the `vim-css-color` plugin, do the following:

`git submodule add https://github.com/ap/vim-css-color.git nvim/bundle/vim-css-color`

### Delete a Neovim plugin

Follow the instructions at https://stackoverflow.com/a/36593218/1300992.

## License

```
MIT License

Copyright (c) 2017 Chafic Najjar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
