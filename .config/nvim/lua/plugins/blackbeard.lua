-- ~/.config/nvim/lua/plugins/blackbeard.lua

local M = {}

M.setup = function()
    local is_transparent = false
    if vim.fn.has("unix") == 1 then
        is_transparent = true
    end

    local colors = {
        bg = '#2B2D42',
        fg = '#DFFAF8',
        black = '#4B0082',
        red = '#483D8B',
        green = '#6A5ACD',  -- New highlight color
        yellow = '#7B68EE',
        blue = '#9370DB',
        magenta = '#8A2BE2',
        cyan = '#7F00FF',
        white = '#D8BFD8',
        brblack = '#9400D3',
        brred = '#8A2BE2',
        brgreen = '#7B68EE',
        bryellow = '#6A5ACD',
        brblue = '#483D8B',
        brmagenta = '#4B0082',
        brcyan = '#7F00FF',
        brwhite = '#D8BFD8',
    }

    vim.cmd('highlight clear')
    vim.cmd('syntax reset')
    vim.o.background = 'dark'
    vim.g.colors_name = 'blackbeard'

    -- Define highlight groups
    local function hi(group, color)
        local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
        local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
        local attr = color.attr and 'gui=' .. color.attr or 'gui=NONE'
        local sp = color.sp and 'guisp=' .. color.sp or ''

        vim.cmd('highlight ' .. group .. ' ' .. fg .. ' ' .. bg .. ' ' .. attr .. ' ' .. sp)
    end

    hi('Normal', { fg = colors.fg, bg = is_transparent and 'NONE' or colors.bg })
    hi('Comment', { fg = colors.brblack, attr = 'italic' }) -- changed from green to brblack
    hi('Constant', { fg = colors.cyan })
    hi('Identifier', { fg = colors.green })  -- Changed to green
    hi('Statement', { fg = colors.green })  -- Changed to green
    hi('PreProc', { fg = colors.yellow })
    hi('Type', { fg = colors.green })  -- Changed to green
    hi('Special', { fg = colors.brblue })
    hi('Underlined', { fg = colors.brgreen, attr = 'underline' })
    hi('Todo', { fg = colors.brred, bg = colors.bg, attr = 'bold' })
    hi('LineNr', { fg = colors.brblack, bg = colors.bg })
    hi('CursorLineNr', { fg = colors.white, bg = colors.bg })

    -- Add more highlight groups as needed
end

return M
