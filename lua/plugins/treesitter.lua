-- Customize Treesitter (configured through AstroCore in v6+)

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = { "lua", "vim", "gitcommit" },
    },
  },
}
