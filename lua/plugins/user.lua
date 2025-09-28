---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      autocmds = {
        eslint_fix_on_save = false,
      },
    },
  },
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
  },
}
