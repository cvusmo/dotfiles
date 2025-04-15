-- ~/.config/nvim/lua/plugins/blackbeard.lua
return {
  "cvusmo-dev/blackbeard-colorscheme",
  lazy = false, -- Load immediately to ensure the colorscheme is available
  config = function()
    require("blackbeard").setup({
      theme = "dark", -- "dark" or "light"
    })
  end,
}
