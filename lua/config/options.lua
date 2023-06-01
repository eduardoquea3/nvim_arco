vim.g.mapleader = ' '

local opt = vim.o

opt.mouse = false
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.errorbells = false
opt.wrap = true
opt.swapfile = false
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.shell = 'zsh'

if vim.fn.has "nvim-0.9.0" == 1 then
  opt.splitkeep = "screen"
  opt.shortmess = "filnxtToOFWIcC"
end

vim.g.completeopt = 'menu,menuone,noselect'
vim.opt.shell = 'zsh'
