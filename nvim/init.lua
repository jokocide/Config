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

-- ####################################
-- #### Packer Manager (lazy.nvim) ####
-- ####################################

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- >>>> LSP (lsp.lua) >>>>
        {
            'williamboman/mason.nvim',              -- Package manager for LSP servers, linters, formatters, etc
            dependencies = {
                'williamboman/mason-lspconfig.nvim' -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
            }
        },
        {
            'hrsh7th/nvim-cmp',          -- Completion engine
            dependencies = {
                'neovim/nvim-lspconfig', -- LSP server discovery
                'hrsh7th/cmp-nvim-lsp',  -- Source #1 --> (lsp.lua)
            }
        },
        -- <<<<<<<<<<<<<

        -- >>>> Formatting (format.lua) >>>>
        'stevearc/conform.nvim', -- Formatting engine
        -- <<<<<<<<<<<<<<<<

        -- >>>> Misc >>>>
        'rstacruz/vim-closer',                 -- Automatically close brackets
        {
            'nvim-tree/nvim-tree.lua',         -- File browser (nvim-tree.lua)
            dependencies = {
                'nvim-tree/nvim-web-devicons', -- Icon support
            }
        },
        'nvim-telescope/telescope.nvim', -- File finder
        "nvim-lualine/lualine.nvim",     -- Status line (lualine.lua)
        -- <<<<<<<<<<<<<<

        -- >>>> Common Dependencies >>>>
        {
            "nvim-treesitter/nvim-treesitter", -- Parsing library.
            build = ":TSUpdate"
        },
        -- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    },
    install = { missing = true, colorscheme = { "alabaster" } },
    checker = { enabled = false },
})

-- General
require("core.keymaps")

-- Plugins
require("core.plugins")
