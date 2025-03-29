local map_to_ijkl = require("ijkl").map_to_ijkl

local opts = {
  replace = {
    key = {
      function(key)
        local r = require("which-key.view").format(key)
        return map_to_ijkl(r) or r
      end,
    },
  },
}

return {
  "folke/which-key.nvim",
  opts = opts,
}