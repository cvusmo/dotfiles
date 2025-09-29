return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        lua = {
          function()
            return { exe = "stylua", args = { "--indent-type", "Spaces", "--indent-width", "2", "-" }, stdin = true }
          end,
        },
        rust = {
          function()
            return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
          end,
        },
        python = {
          function()
            return { exe = "black", args = { "--line-length", "88", "-" }, stdin = true }
          end,
        },
        javascript = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "2" },
              stdin = true,
            }
          end,
        },
        html = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "2" },
              stdin = true,
            }
          end,
        },
        css = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "2" },
              stdin = true,
            }
          end,
        },
        scss = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "2" },
              stdin = true,
            }
          end,
        },
        markdown = {
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--tab-width", "2" },
              stdin = true,
            }
          end,
        },
        c = {
          function()
            return { exe = "clang-format", args = { "--assume-filename", "file.c" }, stdin = true }
          end,
        },
        cpp = {
          function()
            return { exe = "clang-format", args = { "--assume-filename", "file.cpp" }, stdin = true }
          end,
        },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.lua", "*.rs", "*.py", "*.js", "*.html", "*.css", "*.scss", "*.md", "*.c", "*.cpp" },
      callback = function()
        vim.cmd("Format")
      end,
    })
  end,
}
