-- Treesitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "go", "typescript", "zig" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true }
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "gopls", "zls" }
})

-- Completions
local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- Source #1 --> (init.lua)
        { name = 'buffer' },
    })
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Language servers provide different completion results depending on the capabilities of the client.
-- Neovim's default omnifunc has basic support for serving completion candidates.
-- nvim-cmp supports more types of completion candidates,
-- so users must override the capabilities sent to the server such that it can provide these candidates during a completion request.

-- * Lua
lspconfig.lua_ls.setup { capabilities = capabilities }

-- * Go
lspconfig.gopls.setup { capabilities = capabilities }

-- * TypeScript
lspconfig.ts_ls.setup { capabilities = capabilities }

-- * Zig
lspconfig.zls.setup { capabilities = capabilities, cmd = { '/Users/jon/.bin/zls' } }
