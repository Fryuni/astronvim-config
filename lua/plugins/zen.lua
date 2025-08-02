---@type LazySpec
return {
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
      {
        "<Leader>zz",
        "<cmd>ZenMode<CR>",
        desc = "Zen Mode",
      },
    },
    -- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
    ---@type ZenMode
    opts = {
      window = {
        width = 0.5, -- Width of the zen window
        height = 0.8, -- Height of the zen window
        options = {
          signcolumn = "no", -- Disable sign column
          foldcolumn = "0", -- Disable fold column
          cursorline = false, -- Disable cursor line
          colorcolumn = "0", -- Disable color column
          laststatus = 0, -- Disable status line
        },
      },
      plugins = {
        options = {
          showcmd = false, -- Disable command line
          ruler = false, -- Disable ruler
        },
      },
      wezterm = {
        enabled = true, -- Enable/disable wezterm integration
        font_size = "+6", -- Font size to use in wezterm
      },
    },
    dependencies = {
      {
        "folke/twilight.nvim",
        opts = {
          expand = {
            "function",
            "method",
            "table",
            "if_statement",
          },
        },
      },
    },
  },
  -- {
  --   "AstroNvim/astrocore",
  --   ---@type AstroCoreOpts
  --   opts = {
  --     mappings = {
  --       n = {
  --         ["<Leader>zz"] = { "<cmd>ZenMode<CR>", desc = "Zen Mode" },
  --       },
  --     },
  --   },
  -- },
}
