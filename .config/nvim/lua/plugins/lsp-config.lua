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
          "rust_analyzer",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      -- Lua and Clangd setup
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})

      -- Rust setup
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
          },
        },
        handlers = {
          ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            max_width = math.floor(vim.o.columns * 0.8),
          }),
        },
      })

      -- Diagnostic config to limit messages to warnings and errors
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        update_in_insert = false,
        severity_sort = true,
        float = {
          source = "always",  -- Show source in diagnostic float window
        },
        severity = {
          min = vim.diagnostic.severity.WARN,  -- Only show warnings and above
        },
      })

      -- Keymaps for LSP functions
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>nl', vim.lsp.buf.code_action, opts)

      -- Keymaps for diagnostics
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>m', vim.diagnostic.setloclist, opts)

      -- Auto-format on save for Rust files
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function() vim.lsp.buf.format({ async = false }) end,
      })
    end
  },
}
