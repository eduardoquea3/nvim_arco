vim.keymap.set('n', '<leader>ci', ':CocEnable<cr>')
vim.keymap.set('n', '<leader>cf', ':CocDisable<cr>')

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.updatetime = 300

vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<Tab>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-Tab>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

vim.g.coc_global_extensions = { 'coc-lua', 'coc-java', 'coc-db', 'coc-vimlsp', 'coc-json', 'coc-powershell',
  'coc-snippets' }

function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "J", '<CMD>lua _G.show_docs()<CR>', { silent = true })

vim.cmd [[autocmd FileType lua let b:coc_suggest_disable=1]]
vim.cmd [[autocmd FileType python let b:coc_suggest_disable=1]]
vim.cmd [[autocmd FileType javascript let b:coc_suggest_disable=1]]
vim.cmd [[autocmd FileType css let b:coc_suggest_disable=1]]
vim.cmd [[autocmd FileType html let b:coc_suggest_disable=1]]
