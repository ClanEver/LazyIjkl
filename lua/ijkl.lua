local M = {}

M.ijkl_map = {
  i = "h",
  h = "j",
  j = "k",
  k = "i",
  I = "H",
  H = "J",
  J = "K",
  K = "I",
}

function M.map_to_ijkl(str)
  local len = #str
  if len == 0 then
    return str
  elseif len == 1 then
    return M.ijkl_map[str] or str
  end

  local buffer = {}
  local changed = false

  for i = 1, len do
    local c = str:sub(i, i)
    if M.ijkl_map[c] then
      buffer[i] = M.ijkl_map[c]
      changed = true
    else
      buffer[i] = c -- 保持原字符
    end
  end

  return changed and table.concat(buffer) or str
end

return M