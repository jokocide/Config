vim.o.termguicolors = true

local M = {}

M.LIGHT = ""
M.DARK = "zenbones"
M.THEME = M.DARK

function M.set_theme()
    vim.cmd("colorscheme " .. M.THEME)
end

function M.switch_theme()
    M.THEME = (M.THEME == M.DARK) and M.LIGHT or M.DARK
    M.set_theme()
end

M.set_theme()

return M
