local Snacks = require("snacks")
local Picker = require("snacks.picker.source.vim")
local map_to_ijkl = require("ijkl").map_to_ijkl

local ori_picker_keymaps = Picker.keymaps
Picker.keymaps = function(opts)
  local items = ori_picker_keymaps(opts)
  for _, item in ipairs(items) do
    local mapped = map_to_ijkl(item.key)
    if item.key ~= mapped then
      item.item.lhs = mapped
      item.key = mapped
      item.text = Snacks.util.normkey(mapped)
        .. " "
        .. Snacks.picker.util.text(item.item, { "mode", "lhs", "rhs", "desc" })
        .. (item.file or "")
    end
  end
  return items
end

return {}