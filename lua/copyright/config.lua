local util = require("copyright.util")

local c = {
  config = {
    blank = 1,
    fields = {
      {
        format = "@author: %s",
        get = util.getauthor,
      },
      {
        format = "@email: %s",
        get = util.getemail
      },
      {
        format = "@project: %s",
        get = util.getproject
      },
      {
        format = "@filename: %s",
        get    = util.getfilename
      },
      {
        format = "@timestamp: %s",
        get = util.gettimestamp
      },
      {
        format = "Copyright (c) %s All Right Reserved.",
        get = util.getstatement
      }
    }
  }
}

function c:set(cfg)
  if cfg then
    self.config = vim.tbl_deep_extend("force", self.config, cfg)
  end
  return self
end

function c:get()
  return self.config
end

return c
