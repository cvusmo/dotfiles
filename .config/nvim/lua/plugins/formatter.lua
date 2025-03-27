return {
  'mhartington/formatter.nvim',
  config = function()
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        -- Lua formatter
        lua = {
          function()
            return {
              exe = "stylua",
              args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
              stdin = true,
            }
          end,
        },
        -- Rust formatter
        rust = {
          function()
            return {
              exe = "rustfmt",
              args = { "--emit=stdout" },
              stdin = true,
            }
          end,
        },
        -- JSON formatter
        json = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--parser", "json", "--tab-width", "2" },
              stdin = true,
            }
          end,
        },
        -- C formatter
        c = {
          function()
            return {
              exe = "clang-format",
              args = { "--assume-filename", "file.c" },
              stdin = true,
            }
          end,
        },
        -- C++ formatter
        cpp = {
          function()
            return {
              exe = "clang-format",
              args = { "--assume-filename", "file.cpp" },
              stdin = true,
            }
          end,
        },
        -- Python formatter
        python = {
          function()
            return {
              exe = "black",
              args = { "--line-length", "88", "-" },
              stdin = true,
            }
          end,
        },
        -- JavaScript formatter
        javascript = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "2" },
              stdin = true,
            }
          end,
        },
      },
    })

    -- Auto-format on save for specific filetypes
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.lua", "*.rs", "*.json", "*.c", "*.cpp", "*.py", "*.js" },
      callback = function()
        require("formatter").format()
      end,
    })
  end,
}
