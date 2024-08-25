return {
  'mhartington/formatter.nvim',
  config = function()
    require("formatter").setup ({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        lua = {
          function()
            return require("formatter.filetypes.lua").stylua
          end,
        },
        clangd = {
          function()
            return require("formatter.filetypes.clang-format").clangd
          end,
          function()
            return require("formatter.filetypes.clangd").clangd
          end,
        },
        rust = {
          function()
            return require("formatter.filetypes.rust-analyzer").rust
          end,
        },
        --require("formatter.filetypes.any").remove_trailing_whitespace
      },
    })
  end
}
