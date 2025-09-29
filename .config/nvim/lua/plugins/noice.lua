return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          progress = { enabled = true, format = "lsp_progress", view = "mini" },
          signature = { enabled = true },
          -- Customize diagnostic float
          hover = {
            enabled = true,
            view = "hover",
            size = { width = "50%", height = "auto" },
          },
        },
        views = {
          hover = {
            position = { row = "50%", col = "50%" },
            size = { width = "50%", height = "auto" },
            border = { style = "rounded", padding = { 1, 2 } },
            win_options = {
              winblend = 0, -- Remove transparency for better readability
              winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
            },
          },
          mini = {
            win_options = { winblend = 0, winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" } },
            timeout = 5000,
          },
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        background_colour = "#9280E8",
        fps = 30,
        stages = "fade_in_slide_out",
        minimum_width = 20,
        max_width = 50,
        max_height = 20,
        top_down = false,
        timeout = 5000,
      })
    end,
  },
}
