local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    markdown = { "prettierd" },
    handlebars = { "prettierd" },
    glimmer = { "prettierd" },
    golang = { "goimports", "gofmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    injected = {
      ignore_errors = false
    }
  }
}

return options
