require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = "auto"
  },
  sections = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        hide_filename_extension = false,
        show_modified_status = true,
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { 'filename' },
    lualine_y = {},
    lualine_z = { "mode" }
  }
}
