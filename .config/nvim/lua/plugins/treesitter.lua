return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "javascript",
        "html",
        "css",
        "rust",
        "python",
        "markdown",
        "markdown_inline",
        "bash",
        "c", -- Keep for occasional C++ builds
      },
      highlight = { enable = true },
      indent = { enable = true },
      fold = { enable = true },
    })
  end,
}
