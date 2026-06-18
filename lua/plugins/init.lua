-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
vim.pack.add({
  "https://www.github.com/lewis6991/gitsigns.nvim",
  "https://www.github.com/echasnovski/mini.nvim",
  "https://www.github.com/ibhagwan/fzf-lua",
  "https://www.github.com/nvim-tree/nvim-tree.lua",
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
  }, -- Language Server Protocols
  "https://www.github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/creativenull/efmls-configs-nvim",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/folke/which-key.nvim",
})

-- Plugin configurations (order matters: completion before lsp).
require("plugins.treesitter")
require("plugins.explorer")
require("plugins.fzf")
require("plugins.mini")
require("ui.dashboard")
require("plugins.gitsigns")
require("plugins.completion")
require("plugins.lsp")
require("plugins.whichkey")
