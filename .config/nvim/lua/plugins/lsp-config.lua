return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd", 
                    "cmake",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function() 
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({
                cmd = { "clangd", 
                "--compile-commands-dir=/home/echo/GameDev/UnrealEngine/build" }
            })
            lspconfig.cmake.setup({})

            -- lspconfig keymaps
            local opts = { noremap=true, silent=true }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>nl', vim.lsp.buf.code_action, opts)
        end
    },
}

