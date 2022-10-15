local M = {}
-- Modified find_files to search for Git files if inside a Git repo,
-- otherwise search file system
function M.find_files()
  local opts = {}
  local telescope = require "telescope.builtin"

  local ok = pcall(telescope.git_files, opts)
  if not ok then
    telescope.find_files(opts)
  end
end
return M
