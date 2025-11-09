local wk = require("which-key")

wk.add({
  {
    mode = { "n", "v" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },

  { "<C-A>", "gg0vG$", desc = "select all" },
  { "<leader>rt", "<cmd>%s/\t//g<cr>", desc = "remove tabs" },
  { "<leader>vs", "<cmd>vsplit<cr>", desc = "Vertical Split" },
  { "<leader>hs", "<cmd>sp<cr>", desc = "Horizontal Split" },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Buffer Delete" },
  { "<leader>x", "<cmd>x<cr>", desc = "Save and Quit" },
  { "<leader>vt", "<cmd>vert term<cr>", desc = "Vertical Terminal" },
  { "<leader>ht", "<cmd>hori term<cr><cmd>res 15<cr>", desc = "Horizontal Terminal" },
})
