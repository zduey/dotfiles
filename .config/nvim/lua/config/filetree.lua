local M = {}

function M.post()
  vim.api.nvim_set_keymap(
    "n",
    "<leader>n",
    "<CMD>NvimTreeToggle<CR>",
    { silent = true, noremap = true }
  )
  require('nvim-tree').setup()
end
return M
