-- ============================================================================
-- WHICH-KEY (keybinding hints)
-- ============================================================================
local wk = require("which-key")

wk.setup({
  preset = "modern",
  delay = 300,
})

-- Group labels for the leader-prefixed keymaps defined across the config.
wk.add({
  {
    "<leader>f",
    group = "find",
  },
  {
    "<leader>g",
    group = "goto / lsp",
  },
  {
    "<leader>h",
    group = "git hunk",
  },
  {
    "<leader>s",
    group = "split",
  },
  {
    "<leader>b",
    group = "buffer",
  },
  {
    "<leader>d",
    group = "diagnostics",
  },
  {
    "<leader>t",
    group = "terminal / toggle",
  },
})
