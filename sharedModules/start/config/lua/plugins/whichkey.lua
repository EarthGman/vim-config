local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.add({
  -- globals
  {
    mode = { "n", "v" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },

  { "<C-A>", "gg0vG$", desc = "select all" },
  { "<leader>vs", "<cmd>vsplit<cr>", desc = "Vertical Split" },
  { "<leader>hs", "<cmd>sp<cr>", desc = "Horizontal Split" },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Buffer Delete" },
  { "<leader>x", "<cmd>x<cr>", desc = "Save and Quit" },
  { "<leader>vt", "<cmd>vert term<cr>", desc = "Vertical Terminal" },
  { "<leader>ht", "<cmd>hori term<cr><cmd>res 15<cr>", desc = "Horizontal Terminal" },

  -- harpoon keymap
  { "<leader>a", mark.add_file, desc = "Add file to Harpoon" },
  { "<leader>hm", ui.toggle_quick_menu, desc = "Harpoon Menu" },
  { "<C-1>", function() ui.nav_file(1) end, desc = "Harpoon Entry 1" },
  { "<C-2>", function() ui.nav_file(2) end, desc = "Harpoon Entry 2" },
  { "<C-3>", function() ui.nav_file(3) end, desc = "Harpoon Entry 3" },
  { "<C-4>", function() ui.nav_file(4) end, desc = "Harpoon Entry 4" },
})
