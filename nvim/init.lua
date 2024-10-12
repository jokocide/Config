vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.number = true

require("_package")
require("statusline")
require("colors")
require("format")
require("keymaps")
require("lsp")
require("netrw")
require("_telescope")
