-- local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		-- opts = overrides.mason,
		opts = require("configs.mason"),
	},

	{
		"nvim-treesitter/nvim-treesitter",
		-- opts = overrides.treesitter,
		opts = require("configs.treesitter"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		-- opts = overrides.nvimtree,
		opts = require("configs.nvimtree"),
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"ziglang/zig.vim",
	},

	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		cmd = "Neogen",
		keys = {
			{
				"<leader>dd",
				function()
					require("neogen").generate({})
				end,
				desc = "Generate Annotations",
			},
		},
		opts = require("configs.neogen"),
	},
}

return plugins
