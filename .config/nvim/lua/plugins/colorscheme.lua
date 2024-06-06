local is_transparent = false
if vim.fn.has("unix") == 1 then
  is_transparent = true
end

return {
  "dgox16/oldworld.nvim",
  lazy = false,
  priority = 998,
  config = function() 
    require("oldworld").setup({
      transparent = is_transparent,
      italic_comments = true,
      terminal_colors = true,
      borderless_telescope = false,
      background = "hard",
      italics = true,
    })
    vim.cmd("colorscheme oldworld")
  end,
}
