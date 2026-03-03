-- Adapter: reads Omarchy's current neovim theme and applies it without LazyVim.
-- Stock Omarchy neovim.lua files return lazy.nvim specs that include a LazyVim/LazyVim
-- entry for colorscheme setting. This adapter strips that entry and extracts the
-- colorscheme name to apply directly via vim.cmd.colorscheme().

local theme_path = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")

-- Fall back to catppuccin if no Omarchy theme is configured
if vim.fn.filereadable(theme_path) == 0 then
  return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
end

local specs = dofile(theme_path)
local colorscheme = nil
local result = {}

for _, spec in ipairs(specs) do
  if spec[1] == "LazyVim/LazyVim" then
    colorscheme = spec.opts and spec.opts.colorscheme
  else
    table.insert(result, spec)
  end
end

-- Add a config function to apply the colorscheme if the plugin doesn't already have one
if colorscheme and #result > 0 then
  local plugin = result[1]
  if not plugin.config then
    local cs = colorscheme
    plugin.priority = plugin.priority or 1000
    plugin.config = function(_, opts)
      if opts and next(opts) ~= nil then
        local name = plugin.name or plugin[1]:match("/(.+)")
        local ok, mod = pcall(require, name)
        if ok and mod.setup then
          mod.setup(opts)
        end
      end
      vim.cmd.colorscheme(cs)
    end
  end
end

return result
