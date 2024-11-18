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
        black = '#000000',
        red = '#FF2800',
        green = '#00FF00',  -- New highlight color
        yellow = '#DFFF00',
        blue = '#4169E1',
        magenta = '#CC00CC',
        cyan = '#00FFFF',
        white = '#FFFFFF',
        brblack = '#262626',
        brred = '#DC143C',
        brgreen = '#7CFC00',
        bryellow = '#E3FF00',
        brblue = '#006994',
        brmagenta = '#EE82EE',
        brcyan = '#A6E7FF',
        brwhite = '#FFFAFA',
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
    hi('Comment', { fg = colors.brblue, attr = 'italic' }) 
    hi('Constant', { fg = colors.cyan })
    hi('Identifier', { fg = colors.yellow })  -- Changed to yellow
    hi('Statement', { fg = colors.brcyan })  -- Changed to magenta
    hi('PreProc', { fg = colors.yellow })
    hi('Type', { fg = colors.red })  -- Changed to red
    hi('Special', { fg = colors.brblue })
    hi('Underlined', { fg = colors.brgreen, attr = 'underline' })
    hi('Todo', { fg = colors.brred, bg = colors.bg, attr = 'bold' })
    hi('LineNr', { fg = colors.brwhite, bg = colors.bg })
    hi('CursorLineNr', { fg = colors.white, bg = colors.bg })

    -- Add more highlight groups as needed
end

return M
