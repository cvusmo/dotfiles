-- ~/.config/nvim/lua/plugins/blackbeard.lua

return {
    "cvusmo/blackbeard-nvim",
    branch = "dev",
    config = function()
        require("blackbeard").setup({
            theme = "dark", -- Change to "dark" or "light"
        })
    end,
}
