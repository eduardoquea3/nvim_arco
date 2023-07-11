local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup({
  --UI
  'luukvbaal/statuscol.nvim',
  'kdheepak/tabline.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  'catppuccin/nvim',
  'xiyaowong/transparent.nvim',
  'lukas-reineke/indent-blankline.nvim',
  { 'glepnir/dashboard-nvim', event = 'VimEnter' },
  'VonHeikemen/searchbox.nvim',
  'rcarriga/nvim-notify',
  { 'folke/noice.nvim',       event = 'VeryLazy' },
  'norcalli/nvim-colorizer.lua',
  'folke/which-key.nvim',
  'folke/todo-comments.nvim',
  'folke/twilight.nvim',
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

  --autocompletado
  { 'turbio/bracey.vim',     build = 'npm install --prefix server' },
  'jiangmiao/auto-pairs',
  {
    'neoclide/coc.nvim',
    branch = 'master',
    build =
    'yarn install --frozen-lockfile'
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'L3MON4D3/LuaSnip',
  'mattn/emmet-vim',
  'uga-rosa/ccc.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'onsails/lspkind.nvim',
  'nvimdev/lspsaga.nvim',

  --sintasis
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'mg979/vim-visual-multi',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'folke/trouble.nvim',
  'liuchengxu/vista.vim',
  'tpope/vim-surround',

  --navegacion entre archivos y/o proyectos
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim',   version = "0.1.0" },
  'nvim-lua/popup.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-neo-tree/neo-tree.nvim',
  'MunifTanjim/nui.nvim',
  'S1n7ax/nvim-window-picker',
  'nvim-telescope/telescope-file-browser.nvim',
  'ahmedkhalf/project.nvim',

  --terminal
  'akinsho/toggleterm.nvim',
  'kdheepak/lazygit.nvim',
})
