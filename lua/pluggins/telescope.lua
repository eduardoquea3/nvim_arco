vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>of', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope projects<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser hidden=true<cr>')
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope noice<cr>')

local actions = require('telescope.actions')
-- Load Telescope extensions
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<Esc>'] = actions.close,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  },
  pickers = {
    find_files = {
      find_commadn = { "rg", "--files", "--hidden", "--glob", "--line-number" },
    },
    file_browser = {
      find_commadn = { '--hidden', '--line-number', '--files', 'rg' }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      mappings = {
        ["i"] = {
          ['<C-l>'] = require('telescope').extensions.file_browser.actions.change_cwd,
          ['<C-h>'] = require('telescope').extensions.file_browser.actions.change_cwd,
        },
      },
    },
  },
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("notify")
require("telescope").load_extension("noice")
require('telescope').load_extension('projects')
require('telescope').load_extension('file_browser')
