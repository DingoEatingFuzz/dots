require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-t>", function()
  require("nvchad.themes").open()
end, {})
map("i", "jk", "<ESC>")
