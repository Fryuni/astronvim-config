---@type LazySpec
return {
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    -- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
    ---@type ZenOptions
    opts = {},
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>zz"] = { "<cmd>ZenMode<CR>", desc = "Zen Mode" },
        },
      },
    },
  },
}
