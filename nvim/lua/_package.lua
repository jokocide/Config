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
                'hrsh7th/cmp-nvim-lsp',  -- Completion source #1 --> (lsp.lua)
            }
        },
        -- <<<<<<<<<<<<<

        -- >>>> Formatting (format.lua) >>>>
        'stevearc/conform.nvim', -- Formatting engine
        -- <<<<<<<<<<<<<<<<

        -- >>>> Misc >>>>
        'rstacruz/vim-closer',           -- Automatically close brackets
        'nvim-telescope/telescope.nvim', -- File finder
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
