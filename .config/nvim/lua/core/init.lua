-- ~/.config/nvim/lua/core/init.lua

return {
  require("core.autocmds");
  require("core.keymaps");
  require("core.lazy");
  require("plugins");
}
