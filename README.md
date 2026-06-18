# nvim-conf

```
██████╗  ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ █████╗  ██████╗
██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
██████╔╝██║   ██║██║  ██║██████╔╝██║██╔██╗ ██║███████║██║
██╔══██╗██║   ██║██║  ██║██╔══██╗██║██║╚██╗██║██╔══██║██║
██║  ██║╚██████╔╝██████╔╝██║  ██║██║██║ ╚████║██║  ██║╚██████╗
╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝
```

> A modular Neovim configuration. _Allons-z ⚡_

Built for **Neovim 0.12+** using the native [`vim.pack`](https://neovim.io/doc/user/pack.html)
plugin manager and the modern `vim.lsp.config` / `vim.lsp.enable` API — no external
bootstrap required.

## Requirements

- **Neovim ≥ 0.12**
- A **Nerd Font** (statusline, dashboard and diagnostics use glyphs)
- External tools for linting/formatting via `efm` (installed on demand through `mason`):
  `stylua`, `luacheck`, `black`, `flake8`, `prettier_d`, `eslint_d`, `shfmt`,
  `shellcheck`, `clang-format`, `cpplint`, `gofumpt`, `revive`, `fixjson`

## Install

```sh
git clone https://github.com/rodrinac/nvim-conf.git ~/.config/nvim
nvim
```

On first launch `vim.pack` downloads the plugins and `nvim-treesitter` installs the
configured parsers. Restart once it finishes.

## Structure

```
init.lua                 Entry point — requires modules in load order
lua/
├── config/
│   ├── options.lua      Editor options
│   ├── keymaps.lua      General keymaps
│   ├── autocmds.lua     Shared "UserConfig" augroup + autocmds
│   └── statusline.lua   Dynamic statusline
├── ui/
│   ├── theme.lua        Colorscheme + transparency
│   ├── dashboard.lua    mini.starter start screen
│   └── terminal.lua     Floating terminal
└── plugins/
    ├── init.lua         vim.pack.add + ordered requires
    ├── treesitter.lua   Syntax & folding
    ├── explorer.lua     nvim-tree
    ├── fzf.lua          fzf-lua pickers
    ├── mini.lua         mini.nvim modules
    ├── gitsigns.lua     Git signs & hunks
    ├── completion.lua   blink.cmp
    └── lsp.lua          Diagnostics, LSP servers, efm linters/formatters
```

> Load order matters: `completion` is required before `lsp` because the LSP
> servers pull their capabilities from `blink.cmp`.

## Plugins

| Plugin | Purpose |
| --- | --- |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | starter, ai, comment, move, surround, pairs, icons, notify, … |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & folding (`main` branch) |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finder & LSP pickers |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations & hunk actions |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP base configs |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | Tool installer |
| [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim) | efm linters/formatters |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippets |

## Keymaps

Leader is `<Space>`.

### Find (fzf-lua)

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fx` / `<leader>fX` | Document / workspace diagnostics |

### LSP (buffer-local)

| Key | Action |
| --- | --- |
| `K` | Hover |
| `<leader>gd` / `<leader>gD` | Definition (picker / direct) |
| `<leader>gS` | Definition in vertical split |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename |
| `<leader>oi` | Organize imports + format |
| `<leader>fr` / `<leader>fi` / `<leader>ft` | References / implementations / type defs |
| `<leader>nd` / `<leader>pd` | Next / previous diagnostic |

### Git (gitsigns)

| Key | Action |
| --- | --- |
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` / `<leader>hr` | Stage / reset hunk |
| `<leader>hp` / `<leader>hb` | Preview hunk / blame line |
| `<leader>hd` | Diff this |

### UI & windows

| Key | Action |
| --- | --- |
| `<leader>e` | Toggle file explorer |
| `<leader>t` | Toggle floating terminal |
| `<C-h/j/k/l>` | Move between windows |
| `<leader>sv` / `<leader>sh` | Split vertical / horizontal |

### Completion (blink.cmp)

| Key | Action |
| --- | --- |
| `<C-Space>` | Show / hide menu |
| `<CR>` | Accept |
| `<C-j>` / `<C-k>` | Select next / previous |
| `<Tab>` / `<S-Tab>` | Snippet forward / backward |
