local M = {}

function M.post()
  -- Close NVIM if NvimTree is the last buffer
  vim.cmd(
    [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
  )
  vim.api.nvim_set_keymap(
    "n",
    "<leader>n",
    "<CMD>NvimTreeToggle<CR>",
    { silent = true, noremap = true }
  )
  require('nvim-tree').setup()
end
return M
