local M = {}
function M.setup()
  local status_ok, neogit = pcall(require, "neogit")
  if not status_ok then
    return
  end
  vim.api.nvim_set_keymap(
    "n",
    "<leader>g",
    "<CMD>Neogit<CR>",
    { silent = true, noremap = true }
  )
  neogit.setup {
    integrations = {
      diffview = true
    }
  }
end
return M
