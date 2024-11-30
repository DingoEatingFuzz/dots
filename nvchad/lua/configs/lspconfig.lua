require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"ts_ls",
	"clangd",
	"ember",
	"lua_ls",
	"rust_analyzer",
	"gopls",
	"zls",
	"eslint",
}
local nvlsp = require("nvchad.configs.lspconfig")

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

-- local eslint_filetypes = lspconfig.eslint.default_config.filetypes
-- table.insert(eslint_filetypes, "javascript.glimmer")
-- table.insert(eslint_filetypes, "typescript.glimmer")
lspconfig.eslint.setup({
	filetypes = { "javascript.glimmer", "typescript.glimmer" },
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})
