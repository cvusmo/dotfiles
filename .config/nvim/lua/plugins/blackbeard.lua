-- ~/.config/nvim/lua/plugins/blackbeard.lua

return {
    -- Install the plugin from GitHub using the correct plugin name
    "cvusmo/blackbeard-nvim",  -- Directly specify the GitHub repo
    config = function()
        -- Setup the plugin
        require("blackbeard").setup({
            compile = false,  -- Enable compiling the colorscheme
            undercurl = true,  -- Enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,  -- Do not set background color
            dimInactive = false,  -- Dim inactive window (`hl-NormalNC`)
            terminalColors = true,  -- Define `vim.g.terminal_color_{0,17}`
            colors = {  -- Add/modify theme and palette colors
                palette = {},
                theme = { dark = {}, light = {} },
            },
            overrides = function(colors)  -- Modify built-in highlights
                return {}
            end,
            theme = "dark",  -- Set theme to dark or light
            background = {  -- Map the value of `background` option to a theme
                dark = "dark",  -- `vim.o.background = "dark"`
                light = "light"  -- `vim.o.background = "light"`
            },
        })
    end,
}
