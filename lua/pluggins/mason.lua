require('mason').setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require('mason-lspconfig').setup({
  ensure_installed = {
    'cssls', 'html', 'tsserver', 'jsonls', 'lua_ls', 'powershell_es', 'pyright', 'yamlls', 'emmet_ls' },
  automatic_installation = true
})
