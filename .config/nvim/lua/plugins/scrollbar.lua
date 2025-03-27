-- ~/.config/nvim/lua/plugins/scrollbar.lua

return {
    "petertriho/nvim-scrollbar",
    config = function()
        require("scrollbar").setup({
            show = true,
            show_in_active_only = false,
            set_highlights = true,
            folds = 1000,
            max_lines = false,
            hide_if_all_visible = false,
            throttle_ms = 100,
            handle = {
                text = "██",
                color = nil,
                cterm = nil,
                highlight = "ScrollbarHandle",
                hide_if_all_visible = true,
            },
            marks = {
                Cursor = { text = "█", highlight = "ScrollbarCursor", priority = 0 },
                Search = { text = { "─", "═" }, priority = 1, highlight = "ScrollbarSearch" },
                Error = { text = { "▎", "▍" }, priority = 2, highlight = "ScrollbarError" },
                Warn = { text = { "─", "═" }, priority = 3, highlight = "ScrollbarWarn" },
                Info = { text = { "─", "═" }, priority = 4, highlight = "ScrollbarInfo" },
                Hint = { text = { "─", "═" }, priority = 5, highlight = "ScrollbarHint" },
                Misc = { text = { "─", "═" }, priority = 6, highlight = "ScrollbarMisc" },
            },
            excluded_buftypes = { "terminal" },
            excluded_filetypes = { "prompt", "TelescopePrompt" },
            autocmd = {
                render = { "BufWinEnter", "TabEnter", "TermEnter", "WinEnter", "CmdwinLeave", "TextChanged", "VimResized", "WinScrolled" },
                clear = { "BufWinLeave", "TabLeave", "TermLeave", "WinLeave" },
            },
            handlers = {
                cursor = true,
                diagnostic = true,
                gitsigns = true,
                handle = true,
                search = true,
            },
        })

        vim.opt.mouse = "a"

        -- Mouse bindings
        vim.api.nvim_set_keymap("n", "<LeftMouse>", [[<Cmd>lua HandleMouseClick()<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<RightMouse>", [[<Cmd>lua HandleRightMouseClick()<CR>]], { noremap = true, silent = true })
    end,
    init = function()
        _G.HandleMouseClick = function()
            local mouse_pos = vim.fn.getmousepos()
            -- Check if clicking in the bufferline area (top row)
            if mouse_pos.screenrow <= 1 then
                vim.cmd("BufferLinePick")
            else
                -- Check if clicking in Neo-tree
                local win_id = mouse_pos.winid
                if win_id ~= 0 then
                    local buf_name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win_id))
                    if buf_name:match("neo%-tree") then
                        vim.api.nvim_win_call(win_id, function()
                            vim.cmd("Neotree action=focus")
                            -- Simulate Enter to open/select
                            vim.api.nvim_input("<CR>")
                        end)
                    else
                        -- Scroll the buffer
                        local win_height = vim.api.nvim_win_get_height(0)
                        local line_count = vim.api.nvim_buf_line_count(0)
                        local target_line = math.floor((mouse_pos.screenrow / win_height) * line_count)
                        target_line = math.max(1, math.min(line_count, target_line))
                        vim.api.nvim_win_set_cursor(0, { target_line, 0 })
                    end
                end
            end
        end

        _G.HandleRightMouseClick = function()
            local mouse_pos = vim.fn.getmousepos()
            if mouse_pos.screenrow <= 1 then
                vim.cmd("BufferLinePickClose")
            end
        end

        _G.DragScrollOrResize = function()
            local mouse_pos = vim.fn.getmousepos()
            local win_id = mouse_pos.winid
            if win_id == 0 then return end

            local win_config = vim.api.nvim_win_get_config(win_id)
            if win_config.relative ~= "" then
                local new_width = math.max(20, math.min(120, mouse_pos.screencol))
                win_config.width = new_width
                vim.api.nvim_win_set_config(win_id, win_config)
            else
                local current_line = vim.fn.line(".")
                local target_line = math.max(1, math.min(vim.api.nvim_buf_line_count(0), mouse_pos.line))
                local delta = target_line - current_line
                if delta ~= 0 then
                    vim.cmd("normal! " .. math.abs(delta) .. (delta > 0 and "j" or "k"))
                elseif mouse_pos.column <= 2 then
                    vim.cmd("vertical resize " .. math.max(20, mouse_pos.screencol))
                end
            end
        end
    end,
}
