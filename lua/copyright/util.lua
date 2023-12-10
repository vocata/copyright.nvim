local util = {}

local fn, fs, api = vim.fn, vim.fs, vim.api

local function exec(command)
  if fn.executable(command) > 0 then
    return
  end

  return fn.systemlist(command)
end

local function input(text)
  local promote = text .. ": "
  return fn.input(promote)
end

local function exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type or false
end

function util.getauthor()
  local output = exec("git config user.name")
  if output and output[1] then
    return output[1]
  end

  return input("author")
end

function util.getemail()
  local output = exec("git config user.email")
  if output and output[1] then
    return output[1]
  end

  return input("email")
end

function util.getproject()
  for dir in fs.parents(api.nvim_buf_get_name(0)) do
    if exists(dir .. "/.git") then
      return fs.basename(dir)
    end
  end

  return input("project")
end

function util.getfilename()
  return fs.basename(api.nvim_buf_get_name(0))
end

function util.gettimestamp()
  return os.date("%Y-%m-%d %H:%M:%S")
end

function util.getstatement()
  return input("ownership")
end

return util
