vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_browse_split = 0
-- vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25 -- Control size of netrw when opened in a vertical split (:Vex)
vim.g.netrw_list_hide = '^%..*=%$,.DS_Store,.idea,.git,__pycache__,venv,node_modules,*%.o,*%.pyc,.*%.swp'

-- vim.cmd [[
--     augroup ProjectDrawer
--     autocmd!
--     autocmd VimEnter * :Vexplore
--     augroup END
-- ]]