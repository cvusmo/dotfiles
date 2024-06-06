-- Load the UnrealEngine module
local unreal_engine = require('plugins.UnrealEngine')

-- Simple test function
local function build_test(arg)
  if arg == "YES" then
    print("BUILDING TEST")
  elseif arg == "NO" or arg == "" then
    print("BUILD TEST CANCELED")
  else
    print("Invalid argument. Use: :BuildTEST YES or :BuildTEST NO")
  end
end

-- Create the commands in Neovim
vim.cmd([[
  command! -nargs=1 Build lua require('plugins.UnrealEngine').build(<f-args>)
  command! -nargs=1 Clean lua require('plugins.UnrealEngine').clean(<f-args>)
  command! -nargs=1 Rebuild lua require('plugins.UnrealEngine').rebuild(<f-args>)
  command! -nargs=1 Run lua require('plugins.UnrealEngine').run(<f-args>)
  command! -nargs=1 BuildTEST lua require('core.unrealcmds').build_test(<f-args>)
]])

-- Return the build_test function for testing
return {
  build_test = build_test
}
