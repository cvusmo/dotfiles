return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "rcarriga/nvim-notify",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
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
                        view = "mini", -- LSP progress in mini view
                    },
                    signature = {
                        enabled = true,
                    },
                },
                routes = {
                    -- Filter out rust-analyzer progress
                    {
                        filter = {
                            event = "lsp",
                            kind = "progress",
                            find = "rust-analyzer",
                        },
                        opts = { skip = true },
                    },
                    -- Move cmdline-like messages to mini
                    {
                        filter = {
                            event = "msg_show",
                            any = {
                                { find = "%d+L, %d+B" },
                                { find = "; after #%d+" },
                                { find = "; before #%d+" },
                            },
                        },
                        view = "mini",
                    },
                    -- Route DeepSeek messages to notify
                    {
                        filter = {
                            event = "msg_show",
                            find = "DeepSeek loaded with theme",
                        },
                        view = "notify",
                    },
                },
                messages = {
                    view = "notify", -- Default to notify for most messages
                    view_error = "notify",
                    view_warn = "notify",
                },
                notify = {
                    view = "notify",
                },
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup", -- Centered popup for commands and search
                    format = {
                        cmdline = { pattern = "^:", icon = ":", lang = "vim" },
                        search = { pattern = "^/", icon = "/", lang = "regex" },
                        search_back = { pattern = "^?", icon = "?", lang = "regex" },
                    },
                },
                popupmenu = {
                    enabled = true,
                    backend = "nui", -- Centered popup for completion
                },
                views = {
                    cmdline_popup = {
                        position = {
                            row = "50%", -- Center vertically
                            col = "50%", -- Center horizontally
                        },
                        size = {
                            width = "60%", -- Adjust width as needed
                            height = "auto",
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winblend = 10, -- Slight transparency
                            winhighlight = {
                                Normal = "NormalFloat",
                                FloatBorder = "FloatBorder",
                            },
                        },
                    },
                    mini = {
                        win_options = {
                            winblend = 10,
                            winhighlight = {
                                Normal = "NormalFloat",
                                FloatBorder = "FloatBorder",
                            },
                        },
                        timeout = 5000,
                    },
                    notify = {
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
                background_colour = "#000000",
                fps = 30,
                render = "default",
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
