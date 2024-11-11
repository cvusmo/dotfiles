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
          "clangd" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    --setup language servers
    config = function () 
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup ({})
      lspconfig.clangd.setup ({})

      -- rust
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
      })

      -- lspconfig keymaps
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>nl', vim.lsp.buf.code_action, opts)

      -- Diagnostics keymaps
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>m', vim.diagnostic.setloclist, opts)

      -- Format on save for Rust files
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function() vim.lsp.buf.format({ async = false }) end,
      })
    end
  },
}
