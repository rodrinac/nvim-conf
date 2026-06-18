-- Luacheck configuration for Neovim Lua config
std = "lua51"
cache = true

-- Neovim injects the `vim` global
globals = {
  "vim",
}

-- Don't report unused self arguments of methods
self = false

-- Ignore line length warnings (handled by StyLua)
ignore = {
  "631", -- line too long
}

exclude_files = {
  ".luarocks",
}
