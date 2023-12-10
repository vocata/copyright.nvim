local command = vim.api.nvim_create_user_command
local insert = require("copyright.cr").insert

command(
  "Copyright",
  insert,
  { nargs = 0, bang = false }
)
