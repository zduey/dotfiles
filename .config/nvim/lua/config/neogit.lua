local M = {}

function M.setup()
  require("neogit").setup({
    integreations = {
      diffview = true
    },
  })

end

return M
