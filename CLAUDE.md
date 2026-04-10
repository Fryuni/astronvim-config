# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal Neovim configuration built on **AstroNvim v5**. `init.lua` only bootstraps `lazy.nvim`; everything else flows through `lua/lazy_setup.lua`, which loads three spec sources in order:

1. `AstroNvim/AstroNvim` (pinned to `^5`) imported as `astronvim.plugins` — this is the base distro and must come first because it sets `mapleader`/`maplocalleader`.
2. `lua/community.lua` — `astrocommunity` language packs and recipes.
3. `lua/plugins/` — user overrides and custom plugin specs.

Order matters: community specs are intentionally processed before user specs so user plugins can override or extend them via `optional = true` + `opts` merging (the typical AstroNvim pattern used throughout `lua/plugins/`).

`lua/polish.lua` runs last and is the place for raw Lua tweaks that don't fit a plugin spec (currently just a custom `mdx` filetype).

## Lint & format

- **Lua format:** `stylua .` — config in `.stylua.toml` (120 col, 2-space, double quotes, no call parens, collapsed simple statements). Lua formatting via LSP is intentionally disabled (see `.luarc.json` and `.neoconf.json`); `lua_ls` is also in `astrolsp.formatting.disabled`, so always use stylua.
- **Lua lint:** `selene .` — config in `selene.toml` (uses the `neovim` std).

There are no tests in this repo.

## Python venv

`init.lua` prepends `~/.config/nvim/venv/bin` to `PATH` and sets `VIRTUAL_ENV` so plugins requiring `pynvim` (see `requirements.txt`) work without polluting the system Python. The `venv/` and generated `parser/` dirs are gitignored.

## Editing plugin specs — conventions in this repo

- Several files in `lua/plugins/` start with `if true then return {} end` as a kill-switch (`none-ls.lua`, `mason.lua`, `astroui.lua`, `codestats.lua`). Removing that line activates the file. Don't "fix" these by deleting the guard unless you actually want the spec live.
- When extending an AstroNvim/community plugin, mark the spec `optional = true` and merge into `opts` rather than redefining the plugin. Use `require("astrocore").list_insert_unique(...)` to extend list-shaped opts (`ensure_installed`, `sources`, etc.) — this pattern is used in `treesitter`, `mason-tool-installer`, `none-ls`, and the language packs.
- Mappings, vim options, autocmds, and filetypes are configured through `astrocore`'s `opts` (see `lua/plugins/astrocore.lua`), not via raw `vim.api.nvim_set_keymap` calls.
- LSP server config, formatting, and on-attach behavior go through `astrolsp` opts (`lua/plugins/astrolsp.lua`). `format_on_save` is globally enabled with `terraform`/`tf` ignored and `lua_ls`/`terraformls`/`tflint` formatters disabled.

## Language packs

Enabled language packs are listed in `lua/community.lua`. Per-language customization lives in dedicated files under `lua/plugins/` (e.g. `typescript-pack.lua`, `zig.lua`) which layer extra treesitter parsers, LSP servers, DAP adapters, and neotest adapters on top of the community pack. The Zig spec also registers custom `nvim-dap` configurations that shell out to `zig build` before launching `codelldb`.
