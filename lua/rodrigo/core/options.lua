vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line number
opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true

-- Theme
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split
opt.splitright = true
opt.splitbelow = true
