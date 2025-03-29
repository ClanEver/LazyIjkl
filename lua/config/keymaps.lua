-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ijkl
local Ijkl = require("ijkl")
local did_setup = false
if not did_setup then
  for source_key, target_key in pairs(Ijkl.ijkl_map) do
    local this_modes = {
      "i",
      "c",
      "t",
    }
    vim.keymap.set(this_modes, source_key, target_key)
    for _, find_key in ipairs({
      -- if disable flash.nvim, uncomment the following lines
      -- "f",
      -- "F",
      -- "t",
      -- "T",
      "r",
    }) do
      vim.keymap.set({ "n", "o" }, find_key .. source_key, find_key .. target_key)
    end
  end
  did_setup = true
end