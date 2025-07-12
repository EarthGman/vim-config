---@type vim.lsp.Config
return {
  cmd = { "pyright" },
  root_markers = {
    ".git",
  },
  filetypes = { "python" },
  capabilities = {
    experimental = {
      serverStatusNotification = true,
    },
  },
}
