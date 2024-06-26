-- Turn hybrid line numbers on (see https://jeffkreeftmeijer.com/vim-number/).
vim.opt.number = true
vim.opt.relativenumber = true

-- Display long lines as just one line.
vim.opt.wrap = false

-- Ignoring case when searching.
vim.opt.ignorecase = true

-- Highlight current line.
vim.opt.cursorline = true

-- Turn cursorline off when in insert mode.
vim.api.nvim_create_autocmd({ 'InsertEnter', 'InsertLeave' }, { command = 'set cursorline!' })

-- Try to be smart about indenting (C-style).
vim.opt.smartindent = true

-- Automatic back up.
vim.opt.backupdir = { vim.env.HOME .. '/.backup/backup//' }
vim.opt.directory = { vim.env.HOME .. '/.backup/swap//' }
vim.opt.undodir = { vim.env.HOME .. '/.backup/undo//' }

-- vim-plug.
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('andymass/vim-matchup')
Plug('ap/vim-css-color')
Plug('ctrlpvim/ctrlp.vim')
Plug('ellisonleao/gruvbox.nvim')
Plug('jamessan/vim-gnupg')
Plug('junegunn/goyo.vim')
Plug('lambdalisue/suda.vim')
Plug('maksimr/vim-jsbeautify')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('pantharshit00/vim-prisma')
Plug('Raimondi/delimitMate')
Plug('scrooloose/nerdcommenter')
Plug('sheerun/vim-polyglot')
Plug('styled-components/vim-styled-components', { ['branch'] = 'develop' })
Plug('will133/vim-dirdiff')

vim.call('plug#end')

-- Gruvbox (https://github.com/morhetz/gruvbox) theme.
vim.cmd.colorscheme('gruvbox')

require('lualine').setup()

-- Disable auto commenting.
vim.api.nvim_create_autocmd('FileType', { command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o' })

-- Curly brace + enter key = proper indentation.
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<C-o>O', { noremap = true })

-- Buffer navigation.
vim.api.nvim_set_keymap('n', 'gn', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gp', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gd', ':bd<CR>', { noremap = true })

-- Break search after reaching last found item.
vim.opt.wrapscan = false

-- Set leader key to `,`.
vim.g.mapleader = ','

-- Goyo shortcut.
vim.api.nvim_set_keymap('n', '<leader>z', ':Goyo<CR>', { noremap = true, silent = true })

-- Configure Goyo.
vim.g.goyo_width = 140
vim.g.goyo_margin_top = 3
vim.g.goyo_margin_bottom = 3

-- Disable markdown highlight.
vim.api.nvim_create_autocmd('VimEnter', { command = 'highlight clear htmlItalic' })

-- Enable syntax highlighting for .md files.
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = '*.md',
	command = 'set filetype=markdown'
})

-- Super efficient shortcut.
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', ':', '<nop>', { noremap = true })

-- Leave insert mode.
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

vim.api.nvim_set_keymap('v', '<C-c>', '"+yi', {})
vim.api.nvim_set_keymap('v', '<C-x>', '"+c', {})
vim.api.nvim_set_keymap('v', '<C-v>', 'c<ESC>"+p', {})
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r><C-o>+', {})

-- CtrlP: ignore files in .gitignore.
vim.g.ctrlp_user_command = { '.git', 'cd %s && git ls-files -co --exclude-standard' }

-- Compilation shortcuts.
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'tex',
	command = 'noremap <F2> :!xelatex %<CR>'
})

-- Beautify.
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'json',
	command = 'noremap <F3> :%!python -m json.tool<CR>'
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '*.geojson',
	command = 'set filetype=geojson'
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'geojson',
	command = 'noremap <F3> :%!python -m json.tool<CR>'
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'javascript',
	command = 'noremap <F3> :call JsBeautify()<CR>'
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'css',
	command = 'noremap <F3> :call CSSBeautify()<CR>'
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'html', 'svg' },
	command = 'noremap <F3> :call HtmlBeautify()<CR>'
})

-- Allow saving of files as sudo when I forget to start vim using sudo.
vim.cmd('cmap w!! w suda://%')

-- Automatically refresh Vim on buffer/window focus.
vim.api.nvim_create_autocmd('FocusGained', { command = 'checktime' })

-- Move line up one line.
vim.api.nvim_set_keymap('n', '<S-k>', ':m-2<CR>', { noremap = true })

-- Move line down one line.
vim.api.nvim_set_keymap('n', '<S-j>', ':m+<CR>', { noremap = true })

-- Move selected lines up one line.
vim.api.nvim_set_keymap('x', '<S-k>', ':m-2<CR>gv=gv', {})

-- Move selected lines down one line.
vim.api.nvim_set_keymap('x', '<S-j>', ":m'>+<CR>gv=gv", {})

-- Set syntax highlighting of *.snap.js files to JavaScript.
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '*.js.snap',
	command = 'set syntax=javascript'
})

vim.cmd.highlight({ 'CocErrorSign', 'guifg=#fb4934' })
vim.cmd.highlight({ 'CocWarningSign', 'guifg=#fabd2f' })
vim.cmd.highlight({ 'CocErrorHighlight', 'gui=undercurl', 'guisp=#fb4934' })
vim.cmd.highlight({ 'CocWarningHighlight', 'gui=undercurl', 'guisp=#fabd2f' })

-- Ctrl + l = show documentation in preview window.
-- Solution taken from https://github.com/neoclide/coc.nvim/issues/869#issuecomment-501323697.
vim.api.nvim_set_keymap('n', '<C-l>', ':call CocAction("doHover")<CR>', { noremap = true, silent = true })

-- Ctrl + h = to trigger TypeScript completion.
vim.api.nvim_set_keymap('i', '<C-h>', 'coc#refresh()', { expr = true, silent = true })

-- Ctrl + k = go to next error or warning.
-- Ctrl + j = go to previous error or warning.
vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<Plug>(coc-diagnostic-next)', { silent = true })

-- Prettier configuration taken from https://github.com/neoclide/coc-prettier/blob/master/Readme.md#usage.
vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')
vim.api.nvim_set_keymap('v', '<leader>f', '<Plug>(coc-format-selected)', {})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', {})
