-- ~/.config/nvim/lua/plugins/deepseek.lua
return {
    "cvusmo/deepseek-nvim",
    branch = "Master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("deepseek-nvim").setup = require("deepseek-nvim").setup or function(opts)
            opts = opts or {}
            local theme = opts.theme or "dark"
            vim.api.nvim_echo({{ "DeepSeek loaded with theme: " .. theme, "Normal" }}, false, {})
        end

        require("deepseek-nvim").setup({ theme = "dark" })

        -- User commands
        vim.api.nvim_create_user_command("DeepSeekAsk", function(opts)
            require("deepseek-nvim").ask_deepseek(opts.args)
        end, { nargs = 1 })

        vim.api.nvim_create_user_command("DeepSeekExplainSelection", function()
            require("deepseek-nvim").ask_selection()
        end, { nargs = 0 })
    end,
}
