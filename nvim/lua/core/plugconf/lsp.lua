local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "rust_analyzer", "gopls" }
})

lspconfig.lua_ls.setup {
    capabilities = capabilities,
}
lspconfig.gopls.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}
