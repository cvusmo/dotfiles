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
      -- lspconfig keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>nl', vim.lsp.buf.code_action, opts)
    end
  },
}
