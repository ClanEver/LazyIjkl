local Util = require("flash.util")
local map_to_ijkl = require("ijkl").map_to_ijkl

local ori_util_get_char = Util.get_char
Util.get_char = function()
  local c = ori_util_get_char()
  return map_to_ijkl(c) or c
end

return {}