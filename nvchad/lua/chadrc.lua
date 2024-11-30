---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "oceanic-next",
	theme_toggle = { "oceanic-next", "one_light" },

	hl_override = {
		Comment = { italic = true },
	},

	hl_add = {
		NvimTreeOpenedFolderName = { fg = "green", bold = true },
	},
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
