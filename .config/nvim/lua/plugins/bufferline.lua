-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      right_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = { Error = " ", Warn = " " }
        return (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
      end,
      offsets = {
        { filetype = "neo-tree", text = "Neo-tree", highlight = "Directory", text_align = "left" },
      },
      mouse = true,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        pcall(nvim_bufferline)
      end,
    })
  end,
}
