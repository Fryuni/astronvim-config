---@type LazySpec
return {
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    -- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
    ---@type ZenOptions
    opts = {
      options = {
        signcolumn = "no", -- Disable sign column
        foldcolumn = "0", -- Disable fold column
        cursorline = false, -- Disable cursor line
        colorcolumn = "0", -- Disable color column
        showcmd = false, -- Disable command line
        ruler = false, -- Disable ruler
        laststatus = 0, -- Disable status line
      },
      wezterm = {
        enabled = true, -- Enable/disable wezterm integration
        font_size = "+6", -- Font size to use in wezterm
      },
    },
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
