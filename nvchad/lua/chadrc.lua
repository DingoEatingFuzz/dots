---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "oceanic-next",
	theme_toggle = { "oceanic-next", "one_light" },

	hl_override = {
		Comment = { italic = true },
	},

	hl_add = {
		NvimTreeOpenedFolderName = { fg = "green", bold = true },
	},
}

return M
