--Set Transparency
local is_transparent = false
if vim.fn.has("unix") == 1 then
  is_transparent = true
end

return
{
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 998,
    config = function()
      require("cyberdream").setup({
            transparent = is_transparent,
            italic_comments = true,
            hide_fillchars = true,
            --borderless_telescope = false,
            --terminal_colors = true,
      })
      vim.cmd("colorscheme cyberdream")
  end,
}
