-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },

  -- Language packs
  -- { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.gleam" },
  -- { import = "astrocommunity.pack.nix" },
  -- { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.terraform" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.sql" },

  -- { import = "astrocommunity.quickfix.nvim-bqf" },

  { import = "astrocommunity.editing-support.cloak-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.editing-support.copilotchat-nvim" },
  -- { import = "astrocommunity.editing-support.codecompanion-nvim" },

  -- { import = "astrocommunity.note-taking.obsidian-nvim" },

  -- { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
}
