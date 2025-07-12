require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "yapf -f" },
    nix = { "nixfmt" },
    go = { "gofumpt" },
    xml = { "xmlformat" },
    yaml = { "yamlfmt", "yq" },
    sh = { "shfmt" },
  },
  default_format_opts = {
    lsp_format = "fallback",
    stop_after_first = true,
  },
  format_on_save = {
    timeout_ms = 500,
  },
})
