local log = {}

local api = vim.api
local format = string.format

function log.error(s, ...)
  api.nvim_echo({ { format("\r" .. s, ...), "Error" } }, true, {})
end

function log.warning(s, ...)
  api.nvim_echo({ { format("\r" .. s, ...), "WarningMsg" } }, true, {})
end

function log.info(s, ...)
  api.nvim_echo({ { format("\r" .. s, ...), "MoreMsg" } }, true, {})
end

function log.debug(s, ...)
  api.nvim_echo({ { format("\r" .. s, ...), "Debug" } }, false, {})
end

return log
