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
            c = {
              function()
              return require("formatter.filetypes.c").clangformat
              end,
            },
            cpp = {
              function()
              return require("formatter.filetypes.cpp").clangformat
              end,
            },
            rust = {
              function()
              return require("formatter.filetypes.rust").rustfmt
              end,
            },
        },
    })
  end
}
