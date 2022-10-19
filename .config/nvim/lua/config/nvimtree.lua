local M = {}

function M.setup()
  -- Close NVIM if NvimTree is the last buffer
  vim.cmd(
    [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
  )
  require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    view = {
      number = true,
      relativenumber = true,
    },
    filters = {
      custom = { ".git" },
    },
  })
end
return M
