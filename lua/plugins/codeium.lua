if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "Exafunction/codeium.vim",
  event = "VeryLazy",
  dependencies = {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        options = {
          g = {
            codeium_disable_bindings = 1,
          },
        },
        mappings = {
          i = {
            ["<c-i>"] = {
              function() return vim.fn["codeium#Accept"]() end,
              expr = true,
              silent = true,
              desc = "Codeium Accept",
            },
            ["<c-.>"] = {
              function() return vim.fn["codeium#CycleOrComplete"]() end,
              expr = true,
              silent = true,
              desc = "Codeium Cycle",
            },
            ["<c-,>"] = {
              function() return vim.fn["codeium#CycleCompletions"](-1) end,
              expr = true,
              silent = true,
              desc = "Codeium Previous",
            },
            ["<c-x>"] = {
              function() return vim.fn["codeium#Clear"]() end,
              expr = true,
              silent = true,
              desc = "Codeium Clear",
            },
          },
          n = {
            ["<Leader>;"] = { desc = "Codeium" },
            ["<Leader>;c"] = {
              function() return vim.fn["codeium#Chat"]() end,
              desc = "Codeium Chat",
            },
            ["<Leader>;;"] = {
              desc = "Toggle Codeium",
              function()
                local notify = require("astrocore").notify

                if vim.g.codeium_enabled == true then
                  vim.cmd "CodeiumDisable"
                  vim.g.codeium_enabled = false
                  notify("Disabled Codeium", vim.log.levels.WARN)
                else
                  vim.cmd "CodeiumEnable"
                  vim.g.codeium_enabled = true
                  notify("Disabled Codeium", vim.log.levels.WARN)
                end
              end,
            },
          },
        },
      },
    },
    {
      "rebelot/heirline.nvim",
      dependencies = {
        "AstroNvim/astroui",
        "Exafunction/codeium.vim",
      },
      opts = function(_, opts)
        local status = require "astroui.status"

        local component = status.component.builder {
          provider = function() return "Codeium:" .. vim.fn["codeium#GetStatusString"]() end,
          padding = { left = 0, right = 1 },
        }

        table.insert(opts.statusline, 3, component)
      end,
    },
  },
}
