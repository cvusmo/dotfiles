-- ~/.config/nvim/lua/plugins/lsp-config.lua
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "rust_analyzer",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua setup
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }, -- Recognize vim global
                        },
                    },
                },
            })

            -- Clangd setup
            lspconfig.clangd.setup({})

            -- Rust Analyzer setup
            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                        checkOnSave = {
                            command = "clippy",
                        },
                        diagnostics = {
                            disabled = {
                                "unresolved-import",
                            },
                        },
                    },
                },
                handlers = {
                    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                        border = "rounded",
                        max_width = math.floor(vim.o.columns * 0.8),
                    }),
                },
            })

            -- Global diagnostic configuration
            vim.diagnostic.config({
                virtual_text = {
                    spacing = 4,
                    prefix = "●",
                },
                severity_sort = true,
                float = {
                    source = "always",
                    border = "rounded",
                },
                update_in_insert = false,
                severity = {
                    min = vim.diagnostic.severity.WARN,
                },
            })

            -- Auto-format on save for Rust files
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.rs",
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
    },
}
