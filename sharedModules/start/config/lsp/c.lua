---@type vim.lsp.Config
return {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
  },
  root_markers = {
    ".git",
    "makefile",
    "Makefile",
    "justfile",
    "Justfile",
  },
  filetypes = {
    "c",
    "cpp",
    "h",
    "hpp",
    "cuda",
    "objc",
    "objcpp",
  },
}
