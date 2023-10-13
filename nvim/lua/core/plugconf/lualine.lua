require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'doom-one',
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