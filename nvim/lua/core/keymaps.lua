local interact = require("core.interact")
local telescope = require('telescope.builtin')

local M = {}

-- Leader
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- LSP
vim.api.nvim_command([[
    autocmd BufWritePre * lua vim.lsp.buf.format()
]])

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})          -- Rename symbol.
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})     -- View/activate code actions.
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})      -- Move cursor to definition of symbol.
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})  -- Move to implementation of symbol.
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover)                -- Show modal window next to cursor with symbol information.
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})    -- Show modal window with context information.
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next, {})     -- Move to next LSP error.
vim.keymap.set('n', '<leader><S-n>', vim.diagnostic.goto_prev, {}) -- Move to previous LSP error.

-- Tree
--vim.keymap.set('n', '<leader>s', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<S-tab>', ':NvimTreeToggle<CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
--vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fs', telescope.treesitter, {})
--vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fe', function()
  telescope.diagnostics({ bufnr = 0 })
end)
vim.keymap.set('n', '<leader>fae', telescope.diagnostics, {})

-- Buffers/Windows/Tabs
vim.keymap.set('n', '<S-h>', ':bprev<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<CR>')

local function deleteBuffer(force)
  local current_buf = vim.api.nvim_get_current_buf()
  if vim.fn.bufnr('$') == 1 then
    -- If only one buffer is open, just delete the current buffer.
    vim.cmd('bd' .. (force and '!' or ''))
  else
    vim.cmd('bprev')
    vim.cmd('bd' .. (force and '!' or '') .. ' ' .. current_buf)
  end
end

local function saveAndDeleteBuffer()
  if vim.api.nvim_buf_get_name(0) == "" then
    -- Buffer has no name, so prompt user for one.
    interact.prompt(
      "enter name for new file: ",
      function(choice) vim.cmd({ cmd = 'w', args = { choice } }) end,
      function() print("error: must provide a name") end
    )
  else
    -- Buffer has a name already, so just save and delete.
    vim.cmd('w')
    deleteBuffer(true)
  end
end

local function handleBuffer()
  local savePrompt = "Save buffer? (y|Y): "
  if vim.api.nvim_buf_get_option(0, 'modified') == true then
    -- Prompt for confirmation before saving
    interact.confirm(savePrompt, saveAndDeleteBuffer, function() deleteBuffer(true) end)
  else
    -- No need for confirmation, just delete buffer
    deleteBuffer(true)
  end
end

vim.keymap.set('n', '<leader>q', handleBuffer)
vim.keymap.set('n', '<leader>b', ':enew<CR>') -- Open a new empty buffer.
vim.keymap.set('n', '<leader>l', ':ls<CR>')   -- List buffers.
vim.keymap.set('n', '`', '<C-w>w', { noremap = true, silent = true })

-- Movement
vim.keymap.set('n', '<S-j>', '10j<CR>', { silent = true })
vim.keymap.set('n', '<S-k>', '10k<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':m .+1<CR>')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>')

-- Search
vim.keymap.set('n', '<leader>x', ':nohlsearch<CR>')

-- Easy exit
vim.keymap.set('n', 'ZZ', ':wqa!<cr>')

-- Save with <s> in normal mode.
vim.keymap.set('n', 's', ':w<CR>')

-- Colors
local backgrounds = {
  "#141414",
  "#000000"
}

local current_bg_index = 1

local function cycle_background()
  local current_bg = backgrounds[current_bg_index]
  current_bg_index = current_bg_index % #backgrounds + 1
  vim.api.nvim_command('hi Normal guibg=' .. current_bg)
  print("New background: " .. current_bg)
end

vim.keymap.set('n', '<leader>cc', ":Telescope colorscheme<CR>")
vim.keymap.set('n', '<leader>cn', ":lua require('core.plugconf').cycle_background()<CR>")

-- Copy/paste with system clipboard.
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>Y', '"+yg_')
vim.keymap.set('v', '<leader>yy', '"+yy')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
