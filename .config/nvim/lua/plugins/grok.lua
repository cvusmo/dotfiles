return {
  {
    "https://git.cvusmo.dev/nicholasjordan/grok-nvim.git",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("grok").setup({
        api_key = vim.env.GROK_KEY, -- Or load from ~/.secrets (see setup docs)
        model = "grok-4-fast-reasoning", -- Valid current model; alternatives: grok-4-fast-non-reasoning, grok-3
        base_url = "https://api.x.ai/v1",
        temperature = 0.7,
        max_tokens = 1024,
      })
    end,
    -- Optional: Add keymaps (LazyVim style)
    keys = {
      {
        "<leader>gg",
        function()
          require("grok").chat("Your prompt here")
        end,
        desc = "Grok Chat",
      },
      { "<leader>gg", ":Grok ", mode = "v", desc = "Grok Visual Selection" }, -- Customize to handle visual mode
    },
    -- Optional: Add commands
    cmd = "Grok",
  },
}
