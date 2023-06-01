require('notify').setup({
  background_colour = "#000000",
  timeout = 3000,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = "minimal",
  stages = "static",
  max_width = function()
    return math.floor(vim.o.columns * 0.75)
  end,
})
