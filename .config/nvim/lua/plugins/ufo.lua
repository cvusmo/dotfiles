return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost", -- Load after opening a buffer
    config = function()
      -- Basic fold settings
      vim.o.foldcolumn = "1" -- Show fold indicators in gutter
      vim.o.foldlevel = 99 -- Start with most folds open
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Setup nvim-ufo with Treesitter preference
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          -- Filetype-specific mapping
          local ftMap = {
            git = "", -- Disable folding for Git files
            -- Examples:
            -- help = '',
            -- terminal = '',
            -- markdown = {'treesitter', 'indent'},
          }
          -- Use Treesitter as mapping
          return ftMap[filetype] or { "treesitter", "indent" }
        end,
      })
    end,
  },
}
