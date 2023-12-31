vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Drop search highlights
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Cycle through windows
vim.keymap.set('n', '`', '<C-w>w',  { noremap = true, silent = true })

-- Toggle NvimTree
vim.keymap.set('n', '<S-tab>', ':NvimTreeToggle<CR>')

-- Move lines up/down
vim.keymap.set('n', '<S-j>', ':m .+1<CR>')
vim.keymap.set('n', '<S-k>', ':m .-2<CR>')

-- Easy exit
vim.keymap.set('n', 'z', ':wq<CR>')
vim.keymap.set('n', '<S-z>', ':wqa!<CR>')
vim.keymap.set('n', 'q', ':w | bd<CR>')
vim.keymap.set('n', '<S-q>', ':bd!<CR>')

-- Switch buffers 
vim.keymap.set('n', '<S-h>', ':bprev<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
