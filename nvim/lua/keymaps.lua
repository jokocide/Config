local interact = require("interact")
local telescope = require('telescope.builtin')

local M = {}

-- LSP
vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.format()' -- Format on save.
vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, {}) -- Rename symbol.
vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, {}) -- View/activate code actions.
vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition, {}) -- Move cursor to definition of symbol.
vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation, {}) -- Move to implementation of symbol.
vim.keymap.set('n', '<leader>lgr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover) -- Show modal window next to cursor with symbol information.
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, {}) -- Show modal window with error context information.
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_next, {}) -- Move to next LSP error.
vim.keymap.set('n', '<leader>l<S-n>', vim.diagnostic.goto_prev, {}) -- Move to previous LSP error.

-- Tree
vim.keymap.set('n', '<S-tab>', ':Explore<CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
-- vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fs', telescope.treesitter, {})
-- vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fe', function()
    telescope.diagnostics({
        bufnr = 0
    })
end)
vim.keymap.set('n', '<leader>fae', telescope.diagnostics, {})

-- Buffers/Windows/Tabs
vim.keymap.set('n', '<S-h>', ':bprev<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
-- Remap Tab to behave like Enter in Netrw

-- Map <Tab> to <CR> in netrw windows only.
vim.cmd 'au FileType netrw nmap <buffer> <Tab> <CR>'

local function saveAndDeleteBuffer()
    if vim.api.nvim_buf_get_name(0) == "" then
        -- Buffer has no name, so prompt user for one.
        interact.prompt("enter name for new file: ", function(name)
            vim.cmd('w ' .. name .. ' | bd')
        end, function()
            print("error: must provide a name")
        end)
    else
        -- Buffer has a name already, so just save and delete.
        vim.cmd('w | bd')
    end
end

local function handleBuffer()
    local savePrompt = "Save buffer? (y|N): "
    if vim.api.nvim_buf_get_option(0, 'modified') == true then
        -- Prompt for confirmation before saving
        interact.confirm(savePrompt, saveAndDeleteBuffer, function()
            vim.cmd('bd!')
        end)
    else
        -- No need for confirmation, just delete buffer
        vim.cmd('bd')
    end
end

vim.keymap.set('n', '<leader>q', handleBuffer) -- Kill buffer.
--vim.keymap.set('n', '<leader>b', ':enew<CR>') -- Open a new empty buffer.
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR><Esc>') -- Open a new empty buffer.
vim.keymap.set('n', '<leader>l', ':ls<CR>') -- List buffers.
vim.keymap.set('n', '`', '<C-w>w', {
    noremap = true,
    silent = true
})

-- Movement
vim.keymap.set('n', '<S-j>', '10j<CR>', {
    silent = true
})
vim.keymap.set('n', '<S-k>', '10k<CR>', {
    silent = true
})
vim.keymap.set('n', '<C-j>', ':m .+1<CR>')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>')

-- Search
vim.keymap.set('n', '<leader>x', ':nohlsearch<CR>')

-- Easy exit
vim.keymap.set('n', 'ZZ', ':wqa!<cr>')

-- Save with <s> in normal mode.
vim.keymap.set('n', 's', ':w<CR>')

-- Colors
vim.keymap.set('n', '<leader>cc', ":Telescope colorscheme<CR>")
vim.keymap.set('n', '<leader>cn', ":lua require('plugconf.colors').switch_theme()<CR>")

-- Copy/paste with system clipboard.
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>Y', '"+yg_')
vim.keymap.set('v', '<leader>yy', '"+yy')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
