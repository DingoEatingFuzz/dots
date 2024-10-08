---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>dd"] = { ":Neogen <CR>", "Write docs for class/method/etc" },
  },
}

-- more keybinds!

return M
