require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<leader>d'] = require('telescope.actions').delete_buffer, -- Close buffer
                ["<leader>h"] = "which_key",                                -- Help
            },
            i = {
                ["<leader>h"] = "which_key",
            }
        }
    },
}
