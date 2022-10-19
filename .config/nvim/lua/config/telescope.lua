local M = {}

function M.setup()
  local actions = require("telescope.actions")

  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selectoin_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
        },
      },
    },
  })
end

return M
