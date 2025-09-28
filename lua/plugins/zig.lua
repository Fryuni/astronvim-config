---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "zig" })
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "lawrence-laz/neotest-zig", version = "^1", config = function() end },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-zig"(require("astrocore").plugin_opts "neotest-zig"))
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(plugin, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "zls" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    ft = { "zig" },
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "codelldb" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    ft = { "zig" },
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "codelldb" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- On zig projects, register a debug configuration that runs the test binary

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "zig",
        callback = function()
          local dap = require "dap"
          dap.configurations.zig = {
            {
              name = "Debug test",
              type = "codelldb",
              request = "launch",
              program = "${workspaceFolder}/zig-out/bin/test",
              args = {},
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
          }
        end,
      })
    end,
  },
}
