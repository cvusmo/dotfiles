-- ~/.config/nvim/lua/plugins/neotree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  cmd = "Neotree",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = true },
        follow_current_file = true,
      },
      window = { position = "left", width = 30, mappings = { ["<Space>"] = false } },
    })
  end,
}
