vim.o.foldcolumn = '1'
vim.o.foldlevel = 999
vim.foldlevelstart = 999
vim.o.foldenable = true

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.keymap.set('n', 'za', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zc', require('ufo').closeFoldsWith)
vim.keymap.set('n', '<C-m>', require('ufo').peekFoldedLinesUnderCursor)

require('ufo').setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds = { 'imports', 'comment' },
  preview = {
    win_config = {
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      winhighlight = 'Normal:Normal',
      winblend = 0
    },
    mappings = {
      scrollY = '<C-k>',
      scrollE = '<C-j>',
    }
  },
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})
