local M = {}

function M.setup()
  local luasnip = require "luasnip"

  luasnip.config.set_config {
    history = true,
    ext_base_prio = 200,
    ext_prio_increase = 2,
    enable_autosnippets = true,
  }
  require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
  require("luasnip/loaders/from_vscode").load()
end

return M
