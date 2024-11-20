-- ~/.config/nvim/lua/plugins/blackbeard.lua

return {
    "cvusmo/blackbeard-nvim",
    branch = 'dev',  -- Specify dev branch
    config = function()
        require("blackbeard").setup({
            theme = "dark",  -- Set theme to dark or light
        })
    end,
}
