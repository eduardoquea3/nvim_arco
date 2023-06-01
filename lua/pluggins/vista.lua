vim.g.vista_icon_indent = '["▸ ", ""]'

vim.g.vista_default_executive = 'ctags'

vim.cmd [[let g:vista#renderer#enable = 1]]


local map = vim.api.nvim_set_keymap
local d_o = { noremap = true, silent = true }

map('n', '<C-q>', ':Vista coc<cr>', d_o)
map('i', '<C-q>', ':Vista coc<cr>', d_o)
