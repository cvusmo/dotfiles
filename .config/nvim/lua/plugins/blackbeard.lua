-- ~/.config/nvim/lua/plugins/blackbeard.lua

return {
  "cvusmo/blackbeard-nvim",
  branch = "dev",
  lazy = false,
  config = function()
    require("blackbeard").setup({
      --theme = "dark",
      --font_size = 26,
    })
  end,
}
