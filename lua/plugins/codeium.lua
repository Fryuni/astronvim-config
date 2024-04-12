return {
  "Exafunction/codeium.vim",
  config = function()
    -- Disable default codeium bindings
    vim.g.codeium_disable_bindings = 1
  end,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings

        maps.i["<c-i>"] = {
          function() return vim.fn["codeium#Accept"]() end,
          expr = true,
          silent = true,
          desc = "Codeium Accept",
        }
        maps.i["<c-.>"] = {
          function() return vim.fn["codeium#CycleOrComplete"]() end,
          expr = true,
          silent = true,
          desc = "Codeium Cycle",
        }
        maps.i["<c-,>"] = {
          function() return vim.fn["codeium#CycleCompletions"](-1) end,
          expr = true,
          silent = true,
          desc = "Codeium Previous",
        }
        maps.i["<c-x>"] = {
          function() return vim.fn["codeium#Clear"]() end,
          expr = true,
          silent = true,
          desc = "Codeium Clear",
        }

        maps.n["<Leader>;"] = { desc = "Codeium" }
        maps.n["<Leader>;c"] = {
          function() return vim.fn["codeium#Chat"]() end,
          desc = "Codeium Chat",
        }
        maps.n["<Leader>;;"] = {
          desc = "Toggle Codeium",
          function()
            local notify = require("astrocore").notify

            if vim.g.codeium_enabled == true then
              vim.cmd "CodeiumDisable"
              notify("Disabled Codeium", vim.log.levels.WARN)
            else
              vim.cmd "CodeiumEnable"
              notify("Disabled Codeium", vim.log.levels.WARN)
            end
          end,
        }
      end,
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
        }

        table.insert(opts.statusline, 3, component)
      end,
    },
  },
}
