-- Leader
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {}) -- Rename symbol.
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {}) -- Move cursor to definition of symbol.
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover) -- Show modal window next to cursor with symbol information.
vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float, {})
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next, {}) -- Move to next LSP error.
vim.keymap.set('n', '<leader><S-n>', vim.diagnostic.goto_prev, {}) -- Move to previous LSP error.

-- Buffers/Windows/Tabs
vim.keymap.set('n', '<S-h>', ':bprev<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<CR>')
vim.keymap.set('n', 'q',
  function()
    if vim.api.nvim_buf_get_option(0, 'modified') == true then
      local save_choice = vim.fn.input("save buffer? (y|n): ")
      if save_choice == 'y' or save_choice == 'Y' then
        local name = vim.api.nvim_buf_get_name(0)
        if name == '' then
          local name_choice = vim.fn.input("enter name for new file: ")
          if name_choice ~= "" then
            vim.cmd( { cmd = 'w', args = { name_choice } } )
          else
            print("cancelled, invalid file name")
          end
        else
          vim.cmd('w | bprev | bd #')
        end
      else
        vim.cmd('bprev | bd! #')
      end
    else
      vim.cmd('bprev | bd #')
    end
  end
)
vim.keymap.set('n', 't', ':enew<CR>') -- Open a new empty buffer.
vim.keymap.set('n' , '<leader>l', ':ls<CR>') -- List buffers.

-- Movement
vim.keymap.set('n', '<S-j>', '10j<CR>', { silent = true })
vim.keymap.set('n', '<S-k>', '10k<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':m .+1<CR>')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>')

-- Search
vim.keymap.set('n', '<leader>x', ':nohlsearch<CR>')

-- Cycle through windows
vim.keymap.set('n', '`', '<C-w>w', { noremap = true, silent = true })

-- Toggle NvimTree
vim.keymap.set('n', '<S-tab>', ':NvimTreeToggle<CR>')

-- Easy exit
vim.keymap.set('n', 'ZZ', ':wqa!<cr>')

-- save with <s> in normal mode.
vim.keymap.set('n', 's', ':w<CR>')

-- Copy/paste with system clipboard by default
--vim.keymap.set('x', 'y', '"+y')   -- Copy under cursor.
--vim.keymap.set('x', 'Y', '"+y$')  -- Copy to end of line.
--vim.keymap.set('x', 'yy', '"+yy') -- Copy current line.
--vim.keymap.set('x', 'x', '"+x')   -- Remove under cursor.
--vim.keymap.set('x', 'dd', '"+dd') -- Remove current line.
--vim.keymap.set('x', 'D', '"+D')   -- Remove to end of line.
