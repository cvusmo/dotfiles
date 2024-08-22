-- lazy bootcaller
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load custom colorscheme
<<<<<<< HEAD
require("plugins.blackbeard").setup()
=======
require('plugins.blackbeard').setup()

>>>>>>> 8478983c6c93a24b380063109ceb1e453679d03c
require("lazy").setup("plugins")
