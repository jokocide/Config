require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'yami',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
