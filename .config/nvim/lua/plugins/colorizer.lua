-- ~/.config/nvim/lua/plugins/colorizer.lua

return {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require('colorizer').setup()
    end,
}
