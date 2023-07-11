local default_font = "Fira Code"
local default_size = 14;

vim.g.neovide_transparency = 0.75


local function set_font(font, size)
  font = font or default_font
  size = size or default_size

  vim.o.guifont = string.format("%s:h%d", font, size)
end

set_font()

local maps = {
  f0 = 12,
  f1 = 14,
  f2 = 15,
  f3 = 16,
  f4 = 17,
  f5 = 18,
}

for key, value in pairs(maps) do
  vim.keymap.set("n", "<leader>" .. key, function()
    set_font(nil, value)
  end)
end
