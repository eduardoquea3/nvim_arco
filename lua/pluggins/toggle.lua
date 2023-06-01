require('toggleterm').setup({
  size = 20,
  --open_mapping = [[<leader>t]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
vim.keymap.set('n', '<leader>t', ':ToggleTerm<cr>')
vim.keymap.set('t', '<leader>t', '<C-\\><C-n>:ToggleTerm<cr>')
