local configs = require 'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "all",
  highlight = { -- enable highlighting
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  },
  indent = {
    enable = false,
  }
}
vim.keymap.set('n', '<C-a>', 'zo')
vim.keymap.set('n', '<C-c>', 'zc')
