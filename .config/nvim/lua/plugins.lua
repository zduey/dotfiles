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
    -- Package Manager
    use({'wbthomason/packer.nvim'})
    -- Color Scheme
    use({
      "EdenEast/nightfox.nvim",
      config = function()
        vim.cmd "colorscheme nightfox"
      end,
    })
    -- Git
    use {
      "TimUntersberger/neogit",
      requires = {
        "nvim-lua/plenary.nvim",
        'sindrets/diffview.nvim',
      },
      config = function()
        require("config.neogit").setup()
      end,
    }
    use({
      'williamboman/mason.nvim', -- all other packages manager (lsp, dap, formatters, etc.)
      config = "require('config.mason').post()",
    })
    use({
      'nvim-tree/nvim-tree.lua', -- NerdTree replacement
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      keys = "<leader>n",
      config = "require('config.filetree').post()",
    })
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use {
      "folke/which-key.nvim",
      config = function()
      require("config.whichkey").setup()
      end,
    }
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
