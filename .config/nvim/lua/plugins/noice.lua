return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
          -- add options
        },
        dependencies = {
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            --require("telescope").load_extension("noice")
            require("noice").setup({
                lsp = {
                  override = {
                      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                      ["vim.lsp.util.stylize_markdown"] = true,
                      ["cmp.entry.get_documentation"] = true,
                  },
                  progress = {
                    enabled = true,
                    format = "lsp_progress",
                    format_done = "lsp_progress_done",
                    view = "cmdline",
                  },
                  signature = {
                    enabled = true,
                  },
                  routes = {
                    {
                      filter = {
                        event = "msg_show",
                        any = {
                          { find = "%d+L, %d+B" },
                          { find = "; after #%d+" },
                          { find = "; before #%d+" },
                        },
                      },
                      view = "cmdline",
                    },
                  },
                  messages = {
                    view = "cmdline",
                    view_error = "cmdline",
                    view_warn = "cmdline",
                  },
                  notify = {
                    view = "cmdline",
                  },
                  cmdline = {
                    view = "cmdline",
                    enabled = true,
                  },
                  popupmenu = {
                    enabled = true,
                    backend = "cmdline",
                  },
                  views = {
                    mini = {
                        win_options = {
                            winblend = 0,
                          winhighlight = {
                            Normal = "NormalFloat",
                            FloatBorder = "FloatBorder",
                          },
                        },
                    },
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
                background_colour = "#000000",
                fps = "30",
                render = "default",
                stage = "fade_in_slide_out",
                minimum_width = 10,
                max_width = 40,
                max_height = 20,
                top_down = false,
                timeout = 1000,
            })
        end,
    },
}
