-- ~/.config/nvim/lua/plugins/which-key.lua
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            plugins = {
                marks = true,
                registers = true,
                spelling = { enabled = true, suggestions = 20 },
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            win = { -- Updated from `window` to `win`
                border = "single",
                padding = { 1, 2, 1, 2 },
            },
        })

        -- Register keymaps with the new spec
        require("which-key").add({
            { "<leader>n", group = "LSP" },
            { "<leader>e", desc = "Show diagnostics" },
            { "<leader>m", desc = "Diagnostic location list" },
            { "<leader>f", group = "Folds" },
            { "<leader>fc", desc = "Create fold" },
            { "<leader>fd", desc = "Delete fold" },
            { "<leader>ft", desc = "Toggle fold" },
            { "<leader>fO", desc = "Open all folds" },
            { "<leader>fC", desc = "Close all folds" },
            { "<leader>g", group = "Git" }, -- Add Git group for Gitsigns
            { "<leader>ghs", desc = "Stage hunk" },
            { "<leader>ghr", desc = "Reset hunk" },
            { "<leader>ghS", desc = "Stage buffer" },
            { "<leader>ghu", desc = "Undo stage hunk" },
            { "<leader>ghR", desc = "Reset buffer" },
            { "<leader>ghp", desc = "Preview hunk inline" },
            { "<leader>ghb", desc = "Blame line" },
            { "<leader>ghd", desc = "Diff this" },
            { "<leader>ghD", desc = "Diff this ~" },
            { "<leader>b", group = "Bufferline" }, -- Add Bufferline group
            { "<leader>bp", desc = "Toggle pin" },
            { "<leader>bP", desc = "Delete non-pinned buffers" },
            { "<leader>bo", desc = "Delete other buffers" },
            { "<leader>br", desc = "Delete buffers to the right" },
            { "<leader>bl", desc = "Delete buffers to the left" },
        })
    end,
}
