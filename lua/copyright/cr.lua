local cr = {}

local config = require("copyright.config")
local log = require("copyright.log")

local api = vim.api
local format = string.format

function cr.insert()
  local headers, cs = {}, vim.bo.commentstring
  local cfg = config:get()

  for _, field in ipairs(cfg.fields) do
    local desc
    if type(field.get) == "string" then
      desc = field.get
    end
    if type(field.get) == "function" then
      desc = field.get()
    end

    if desc and desc ~= "" then
      headers[#headers + 1] = format(cs, format(field.format, desc))
    end
  end

  for _ = 1, cfg.blank do
    headers[#headers + 1] = ""
  end

  api.nvim_buf_set_lines(0, 0, 0, false, headers)
end

return cr
