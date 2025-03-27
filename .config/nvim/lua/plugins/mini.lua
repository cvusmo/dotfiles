-- ~/.config/nvim/lua/plugins/mini.lua
return {
    {
        "echasnovski/mini.nvim",
        version = false, -- Use latest version
        config = function()
            -- Setup mini.bufremove (required by Bufferline)
            require("mini.bufremove").setup()
            -- Optionally setup other mini modules if desired
            -- require("mini.comment").setup() -- Example: Enable mini.comment
        end,
    },
}
