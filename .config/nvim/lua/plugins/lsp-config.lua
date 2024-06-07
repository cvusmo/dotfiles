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

            -- Configure lua_ls
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = { 
                            version = 'LuaJIT',
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true), 
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Configure clangd
            lspconfig.clangd.setup({
                cmd = { "clangd",
                "--compile-commands-dir=/home/echo/GameDev/UnrealEngine/build" }
            })

            -- Configure cmake
            lspconfig.cmake.setup({})

            -- lspconfig keymaps
            local opts = { noremap=true, silent=true }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>nl', vim.lsp.buf.code_action, opts)
        end
    },
}


