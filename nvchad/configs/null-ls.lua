local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local h = require "null-ls.helpers"
local cmd_resolver = require "null-ls.helpers.command_resolver"
local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.diagnostics.eslint_d,
  -- so prettier works only on these filetypes
  b.formatting.prettier.with {
    filetypes = {
      "html",
      "markdown",
      "css",
      "typescript",
      "javascript",
      "handlebars",
    },
  },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

local template_lint = {
  name = "ember-template-lint",
  meta = {
    url = "https://github.com/ember-template-lint/ember-template-lint",
    description = "Lints and formats Ember Handlebars and Glimmer templates",
  },
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "handlebars" },
  generator = null_ls.generator {
    command = "node_modules/.bin/ember-template-lint",
    -- dynamic_command = cmd_resolver.from_node_modules(),
    args = {
      "--format=json",
      "--filename",
      "$FILENAME",
    },
    to_stdin = true,
    from_stderr = true,
    format = "json_raw",
    check_exit_code = function(_, stderr)
      print(stderr)
    end,
    on_output = function(params)
      -- Get the diagnostics data from the output table
      local name = ""
      for key, _ in pairs(params.output) do
        name = key
      end

      print(name)
      local entry = params.output[name]
      print(entry)

      -- Format using the standard from_json helper
      local parser = h.diagnostics.from_json {
        attributes = {
          code = "rule",
          source = "ember-template-lint",
          severity = "severity",
        },
        severities = {
          [-1] = h.diagnostics.severities["hint"],
          [0] = h.diagnostics.severities["information"],
          [1] = h.diagnostics.severities["warning"],
          [2] = h.diagnostics.severities["error"],
          _fallback = h.diagnostics.severities["warning"],
        },
      }

      return parser { output = entry }
    end,
  },
}

-- null_ls.register(template_lint)

null_ls.setup {
  debug = true,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
