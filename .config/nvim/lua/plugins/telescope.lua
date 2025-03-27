-- ~/.config/nvim/lua/plugins/telescope.lua
return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        width = 0.9,
                        height = 0.8,
                        preview_width = 0.5,
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.close,
                            ["<CR>"] = actions.select_default,
                            ["<C-x>"] = actions.delete_buffer,
                        },
                        n = {
                            ["q"] = actions.close,
                            ["<C-x>"] = actions.delete_buffer,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        file_ignore_patterns = { "node_modules", "%.git" },
                    },
                    live_grep = {
                        additional_args = function() return { "--hidden" } end,
                    },
                    buffers = {
                        mappings = {
                            i = {
                                ["<C-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["d"] = actions.delete_buffer,
                            },
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    file_browser = {
                        theme = "ivy",
                        hijack_netrw = true,
                    },
                },
            })

            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")

            -- Define Telescope keymaps here
            local map = vim.keymap.set
            map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
            map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
            map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
            map("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File browser" })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
}
