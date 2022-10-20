local M = {}

function M.setup()
  local luasnip = require("luasnip")

  luasnip.config.set_config {
    history = false,
    ext_base_prio = 200,
    ext_prio_increase = 2,
    enable_autosnippets = true,
  }
  require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
  require("luasnip.loaders.from_vscode").load()

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local tab_complete = function()
    if luasnip.expand_or_jumpable() then
      return t("<Plug>luasnip-expand-or-jump")
    end
    return t("<Tab>")
  end
  local s_tab_complete = function()
    if luasnip.jumpable(-1) then
      return t("<Plug>luasnip-jump-prev")
    end
    return t("<S-Tab>")
  end

  vim.api.nvim_set_keymap("i", "<Tab>", "", { callback = tab_complete, expr = true })
  vim.api.nvim_set_keymap("s", "<Tab>", "", { callback = tab_complete, expr = true })
  vim.api.nvim_set_keymap("i", "<S-Tab>", "", { callback = s_tab_complete, expr = true })
  vim.api.nvim_set_keymap("s", "<S-Tab>", "", { callback = s_tab_complete, expr = true })
  vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
  vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
end

return M
