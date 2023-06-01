local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

require("cmp").setup({
  window = {
    completion = cmp.config.window.bordered {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },
})

--cmp.setup {
--  formatting = {
--    fields = { 'kind', 'abbr', 'menu' },
--    format = function(entry, vim_item)
--      local kind = lspkind.cmp_format({
--        mode = 'symbol_text',
--        maxwidth = 50,
--      })(entry, vim_item)
--      local strings = vim.split(kind.kind, '%s', { trimempty = true })
--      kind.kind = " " .. strings[1] .. " "
--      kind.menu = "    (" .. strings[2] .. ")"
--      return kind
--    end
--  }
--}

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    --completion = cmp.config.window.bordered({
    --  col_offset = -3,
    --  side_padding = 0,
    --  winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
    --}),
    documentation = cmp.config.window.bordered({
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
    })
  },
  mapping = cmp.mapping.preset.insert({
    --['<C-Space>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
  },
})

require('lspkind').init({
  symbol_map = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
  },
})

vim.keymap.set('n', '<leader>ccd', ":lua require 'cmp'.setup.buffer { enabled = false }<cr>")
vim.keymap.set('n', '<leader>cce', ":lua require 'cmp'.setup.buffer { enabled = true }<cr>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "java",
    "astro",
    "json",
  },
  callback = function()
    vim.cmd(":lua require 'cmp'.setup.buffer { enabled=false }")
  end,
})


require('luasnip.loaders.from_vscode').load {}
