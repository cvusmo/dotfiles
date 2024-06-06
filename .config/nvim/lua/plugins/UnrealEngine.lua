local M = {}

-- Function to execute shell commands and capture output
local function execute_command(cmd)
  local handle = io.popen(cmd)
  if not handle then
    error("Failed to execute command: " .. cmd)
  end
  local result = handle:read("*a")
  handle:close()
  return result
end

-- Function to check if a file exists
local function file_exists(path)
  local file = io.open(path, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

local original_build_script = "/home/echo/Projects/UnrealEngine/Engine/Build/BatchFiles/Linux/Build.sh"
local unreal_editor_path = "/home/echo/Projects/UnrealEngine/Engine/Binaries/Linux/UnrealEditor"

-- Function to create a new project if it doesn't exist
local function create_project(name)
  local project_path = "/home/echo/Projects/" .. name .. "/" .. name .. ".uproject"
  if file_exists(project_path) then
    print("Project file found: " .. project_path)
  else
    print("Project file not found. Creating a new project...")
    os.execute("mkdir -p /home/echo/Projects/" .. name)
    os.execute(unreal_editor_path .. " /home/echo/Projects/" .. name .. "/" .. name .. ".uproject -game -CreateBlankProject")
  end
end

-- :Build command
function M.build(name)
  local project_path = "/home/echo/Projects/" .. name .. "/" .. name .. ".uproject"
  create_project(name)
  print("Building project...")
  os.execute(original_build_script .. " -projectfiles -project=" .. project_path .. " -game -engine -progress")
end

-- :Clean command
function M.clean(name)
  local project_path = "/home/echo/Projects/" .. name .. "/"
  print("Cleaning project...")
  os.execute("rm -rf " .. project_path .. "Binaries " .. project_path .. "Intermediate " .. project_path .. "Saved")
end

-- :Rebuild command
function M.rebuild(name)
  M.clean(name)
  M.build(name)
end

-- :Run command
function M.run(name)
  local project_path = "/home/echo/Projects/" .. name .. "/" .. name .. ".uproject"
  create_project(name)
  print("Running project...")
  os.execute("cd /home/echo/Projects/UnrealEngine/Engine/Binaries/Linux/ && ./UnrealEditor " .. project_path)
end

return M
