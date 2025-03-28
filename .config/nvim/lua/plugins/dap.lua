-- ~/.config/nvim/lua/plugins/dap.lua
return
{ 
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("dapui").setup({
            libary =
          {
            plugins = { "nvim-dap-ui" },
            types = true
          },
      })
  end,
}
  
