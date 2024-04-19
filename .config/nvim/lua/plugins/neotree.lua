return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Neotree" },
    keys = {
      { "<C-t>", ":Neotree toggle<CR>", desc = "Toggle file explorer" },
      { "<C-e>", ":Neotree filesystem reveal left<CR>", desc = "Reveal file system left side" },
      { "<C-q>", ":q<CR>", desc = "Quit/:q" },
      { "<C-w>", ":w<CR>", desc = "Save file/:w" },
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
        follow_current_file = true,
        },
    })
    end,
}
