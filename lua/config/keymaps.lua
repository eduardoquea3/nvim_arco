local key = vim.keymap.set

key('n', '<C-Up>', ':resize -2<CR>')
key('n', '<C-Down>', ':resize +2<CR>')
key('n', '<C-Left>', ':vertical resize -2<CR>')
key('n', '<C-Right>', ':vertical resize +2<CR>')
key('i', '<a-j>', '<Esc>:m .+1<cr>==gi')
key('i', '<a-k>', '<Esc>:m .-2<cr>==gi')
key('n', '<a-j>', ':m .+1<cr>==')
key('n', '<a-k>', ':m .-2<cr>==')
key('n', '<leader>ls', ':Bracey<cr>')
key('n', '<leader>q', ':q<cr>')
key('n', '<leader>wq', ':wq<cr>')
key('n', '<leader>qq', ':q!<cr>')
key('n', '<leader>ww', ':w<cr>')
key('n', '<leader>vd', ':bdelete<cr>')
key('n', '<leader>n', ':NeoTreeFloatToggle<cr>')
key('t', '<Esc>', '<C-\\><C-n>')
key('n', '<C-j>', '<C-w>j')
key('n', '<C-h>', '<C-w>h')
key('n', '<C-k>', '<C-w>k')
key('n', '<C-l>', '<C-w>l')
key('n', '<leader>l', ':Twilight<cr>')
key('n', '<leader>a', ':WhichKey<cr>')
key({ 'n', 'i' }, '<C-r>', ':luafile %<cr>')

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

local function km(b)
  map(b, '<up>', '<nop>', default_opts)
  map(b, '<down>', '<nop>', default_opts)
  map(b, '<left>', '<nop>', default_opts)
  map(b, '<right>', '<nop>', default_opts)
end
km('n')
km('i')
km('v')

map('i', '<C-a>', '<left>', default_opts)
map('i', '<C-s>', '<down>', default_opts)
map('i', '<C-w>', '<up>', default_opts)
map('i', '<C-d>', '<right>', default_opts)

map('n', '<S-Tab>', ':bprevious<cr>', { silent = true })
map('n', '<Tab>', ':bnext<cr>', { silent = true })
key('n', '<leader>gg', ':LazyGit<cr>')
key('n', '<c-a>', 'zo')
key('n', '<c-c>', 'zc')
