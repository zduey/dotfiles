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
  require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
  }

  vim.g.nvim_tree_respect_buf_cwd = 1
  })
end
return M
