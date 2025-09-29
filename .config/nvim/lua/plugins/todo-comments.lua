-- ~/.config/nvim/lua/plugins/todo-comment.lua
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lspconfig" }, -- Required for LSP integration
    config = function()
      require("todo-comments").setup({
        -- Default configuration with customizations
        signs = true, -- Show icons in the signs column
        sign_priority = 8, -- Sign priority to avoid conflicts
        keywords = {
          FIXME = {
            icon = " ", -- Icon for FIX
            color = "error", -- Use error color
            alt = { "FIX", "BUG", "FIXIT", "ISSUE" }, -- Alternative keywords
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = "󰎞 ", color = "hint", alt = { "INFO" } },
        },
        merge_keywords = true, -- Merge with default keywords
        highlight = {
          before = "", -- No highlight before keyword
          keyword = "wide", -- Highlight keyword and surrounding chars
          after = "fg", -- Highlight text after keyword with foreground
          pattern = [[.*<(KEYWORDS)\s*:]], -- Match keywords followed by colon
          comments_only = true, -- Only highlight in comments
          max_line_len = 400, -- Ignore long lines
          exclude = {}, -- No file type exclusions
        },
        colors = {
          error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
          warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
          info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
          hint = { "LspDiagnosticsDefaultHint", "#DC2626" },
          default = { "Identifier", "#7C3AED" },
        },
        search = {
          command = "rg", -- Use ripgrep
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          pattern = [[\b(KEYWORDS):]], -- Match keyword followed by colon
        },
      })
    end,
  },
}
