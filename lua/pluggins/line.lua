local colors = {
  red         = '#cdd6f4',
  grey        = '#181825',
  black       = '#1e1e2e',
  white       = '#313244',
  light_green = '#6c7086',
  orange      = '#fab387',
  green       = '#a6e3a1',
  blue        = '#80A7EA',
  roj         = '#ec5f67',
  magenta     = '#c678dd',
  violet      = '#a9a1e1',
  cyan        = '#008080',
}

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.blue, bg = colors.white },
    c = { fg = colors.white, bg = colors.black },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.orange } },
  visual = { a = { fg = colors.black, bg = colors.green } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

local vim_icons = {
  function()
    return " "
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.roj,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.roj,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.roj,
      ce = colors.roj,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.roj,
      t = colors.roj,
    }
    return { bg = "#313244", fg = mode_color[vim.fn.mode()] }
  end,
  separator = { left = "", right = "" },
}

local space = {
  function()
    return " "
  end,
  color = { bg = colors.black, fg = "#80A7EA" },
}

local filename = {
  'filename',
  file_status = false,
  color = { bg = "#80A7EA", fg = "#242735" },
  separator = { left = "", right = "" },
}

local filetype = {
  "filetype",
  icon_only = true,
  colored = true,
  color = { bg = "#313244" },
  separator = { left = "", right = "" },
}

local filetype_tab = {
  "filetype",
  icon_only = true,
  colored = true,
  color = { bg = "#313244" },
}

local buffer = {
  require 'tabline'.tabline_buffers,
  separator = { left = "", right = "" },
}

local tabs = {
  require 'tabline'.tabline_tabs,
  separator = { left = "", right = "" },
}

local fileformat = {
  'fileformat',
  color = { bg = "#b4befe", fg = "#313244" },
  separator = { left = "", right = "" },
}

local time = {
  function()
    return " " .. os.date("%H:%M:%S")
  end,
  color = { bg = "#313244", fg = "#80A7EA" },
  separator = { left = "", right = "" },
}

local branch = {
  'branch',
  color = { bg = "#a6e3a1", fg = "#313244" },
  separator = { left = "", right = "" },
}

local diff = {
  "diff",
  color = { bg = "#313244", fg = "#313244" },
  separator = { left = "", right = "" },
}

local modes = {
  'mode',
  fmt = function(str) return str:sub(1, 1) end,
  color = { bg = "#fab387		", fg = "#1e1e2e" },
  separator = { left = "", right = "" },
}

local function getLspName()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "  " .. client.name
    end
  end
  return "  " .. msg
end

local dia = {
  'diagnostics',
  color = { bg = "#313244", fg = "#80A7EA" },
  separator = { left = "", right = "" },
}

local lsp = {
  function()
    return getLspName()
  end,
  separator = { left = "", right = "" },
  color = { bg = "#f38ba8", fg = "#1e1e2e" },
}

require('lualine').setup {

  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'dashboard', 'SidebarNvim', 'TelescopePrompt', 'neo-tree', 'mason', 'lazygit' },
      tabline = { 'dashboard', 'SidebarNvim', 'TelescopePrompt', 'neo-tree', 'mason', 'lazygit' },
    },
    ignore_focus = {},
    always_divide_middle = false,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },

  sections = {
    lualine_a = {
      modes,
      vim_icons,
    },
    lualine_b = {
      space,
    },
    lualine_c = {
      filename,
      filetype,
      space,
      branch,
      diff,
    },
    lualine_x = {
      space,
    },
    lualine_y = {
      time,
      fileformat,
      space,
    },
    lualine_z = {
      dia,
      lsp,
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      buffer,
    },
    lualine_b = {
    },
    lualine_c = {},
    lualine_x = {
      --tabs,
    },
    lualine_y = {
      space,
    },
    lualine_z = {
    },
  },
  winbar = {},
  inactive_winbar = {},
}

require 'tabline'.setup {
  enable = true,
  options = {
    component_separators = { '', '' },
    section_separators = { '', '' },
    max_bufferline_percent = 100,
    show_tabs_always = true,
    show_devicons = true,
    colored = true,
    show_bufnr = false,
    tabline_show_last_separator = true,
    show_filename_only = true,
    modified_icon = " ",
    modified_italic = true,
    show_tabs_only = false,
  }
}
vim.cmd [[
      set guioptions-=e
      set sessionoptions+=tabpages,globals
    ]]
