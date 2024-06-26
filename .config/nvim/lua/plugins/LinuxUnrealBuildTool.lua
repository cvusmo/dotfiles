if 1 ~= vim.fn.has "nvim-0.7.0" then
  vim.api.nvim_err_writeln "LinuxUnrealBuildTool.nvim requires at least nvim-0.7.0"
  return
end

if vim.g.loaded_unrealnvim == 1 then
  return
end
vim.g.loaded_unrealnvim = 1

vim.api.nvim_create_user_command("Start", function(opts)
    require("core.unrealcmds").start(opts)
end, { nargs = 1 })

vim.api.nvim_create_user_command("Build", function(opts)
    require("core.unrealcmds").build(opts)
end, { nargs = 1 })

vim.api.nvim_create_user_command("Clean", function(opts)
    require("core.unrealcmds").clean(opts)
end, { nargs = 1 })

vim.api.nvim_create_user_command("Rebuild", function(opts)
    require("core.unrealcmds").rebuild(opts)
end, { nargs = 1 })

vim.api.nvim_create_user_command("Run", function(opts)
    require("core.unrealcmds").run(opts)
end, { nargs = 1 })

vim.api.nvim_create_user_command("BuildPlugin", function(opts)
    require("core.unrealcmds").build_plugin(opts)
end, { nargs = 1 })

function setup(args)
    print("Setting up Unreal Engine plugin")
end

return {
    setup = setup
}
