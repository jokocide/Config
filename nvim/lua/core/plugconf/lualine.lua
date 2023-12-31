require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'umbra',
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
