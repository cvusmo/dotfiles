-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
    {
        -- Use the local directory path to the colorscheme
        dir = vim.fn.stdpath('config') .. '/lua/plugins/blackbeard',
        name = 'blackbeard-colorscheme',
        config = function()
            require("plugins.blackbeard").setup()
        end,
    },
}
