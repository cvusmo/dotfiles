--nvim-dap-ui from https://github.com/rcarriga/nvim-dap-ui
return
{ 
    "rcarriga/nvim-dap-ui", 
    dependencies = {
      "mfussenegger/nvim-dap", 
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("dapui").setup({
            library =
          {
            plugins = { "nvim-dap-ui" },
            types = true
          },
      })
  end,
} 
