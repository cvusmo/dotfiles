-- ~/.config/nvim/lua/plugins/grok.lua

return {
  {
    "acris-software/grok-nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "dev",
    config = function()
      require("grok").setup({
        model = "grok-3-mini",
        base_url = "https://api.x.ai/v1",
        temperature = 0.7,
        max_tokens = 256,
        debug = true, -- Enable debug mode for logging
      })
    end,
  },
}
