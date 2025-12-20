local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    sass = { "prettier" },
    html = { "prettier" },
    vue = { "prettier" },
    jsx = { "prettier" },
    tsx = { "prettier" },

    sh = { "shfmt" },
    json = { "prettier" },
    yaml = { "prettier" },
    cs = { "csharpier" },
    python = { "yapf" },
    go = { "gofmt" },
    md = { "markdown-toc" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
