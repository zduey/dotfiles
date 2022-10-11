-- compile packer any time this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- define function to help bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

return require('packer').startup({
  function(use)
    -- Plugins
    use({'wbthomason/packer.nvim'}) -- package manager
    use({
      'williamboman/mason.nvim', -- all other packages manager (lsp, dap, formatters, etc.)
      config = "require('config.mason').post()",
    })
    use({"EdenEast/nightfox.nvim"}) -- colorscheme
    use({
      'nvim-tree/nvim-tree.lua', -- NerdTree replacement
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      keys = "<leader>n",
      config = "require('config.filetree').post()",
    })
    if packer_bootstrap then
    require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
