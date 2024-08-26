if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  'https://gitlab.com/code-stats/code-stats-vim.git',
  config = function ()
    local config_path = vim.fn.stdpath("config")
    ---@cast config_path string
    config_path = vim.fs.normalize(vim.fs.joinpath(config_path, "../codestats_key"))

    local fh = io.open(config_path, "r")
    if fh then
      local key = fh:read("*l")
      vim.g.codestats_api_key = key
      fh:close()
    end
  end,
}
