if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "githubmodels",
        model = "claude-3.5-sonnet"
      },
      inline = {
        adapter = "githubmodels",
        model = "gpt-4o"
      }
    },
  },
}
