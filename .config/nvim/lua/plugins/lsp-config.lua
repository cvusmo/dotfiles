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
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<Leader>K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<Leader>N", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<Leader>C", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "rust_analyzer" },
        automatic_enable = true,
      })

      local servers = { "lua_ls", "clangd", "rust_analyzer" }
      for _, server_name in ipairs(servers) do
        vim.lsp.config(server_name, {  -- New API: vim.lsp.config instead of require('lspconfig')[server_name].setup
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
}
