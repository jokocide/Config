vim.o.termguicolors = true
local background = "#101010"

-- Define the override function
local function override()
  -- Normal
  vim.cmd('highlight Normal cterm=NONE ctermbg=16 ctermfg=15 gui=NONE guibg=' .. background .. ' ' .. 'guifg=#FFFFFF')
  -- VertSplit
  vim.cmd('highlight VertSplit cterm=NONE ctermbg=16 gui=NONE guibg=' .. background)
  -- LineNr
  vim.cmd('highlight LineNr cterm=NONE ctermbg=16 gui=NONE guibg=' .. background)
end

-- Create an autocommand group
local override_group = vim.api.nvim_create_augroup('override', { clear = true })

-- Create an autocommand to call the override function when a new colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = override,
  group = override_group,
})

-- End the autocommand group
vim.api.nvim_command('augroup END')

vim.cmd [[ colorscheme meh ]]
