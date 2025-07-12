---@type vim.lsp.Config
return {
  cmd = { "nil" },
  root_markers = {
    ".git",
    "flake.nix",
    "flake.lock",
  },
  init_options = {
    nix = {
      flake = {
        autoArchive = true,
        -- auto eval flake inputs for improved completion
        -- generates too many issues
        autoEvalInputs = false,
      },
    },
  },
  settings = {
    formatting = {
      command = { "nixfmt" },
    },
    telemetry = { enable = false },
  },
  filetypes = { "nix" },
}
