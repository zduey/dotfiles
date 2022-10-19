local M = {}

function M.setup ()

  local packer_sync_required  = false

  local packer_config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
  }

  local function initialize_packer()
    -- Check if packer is installed
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
      packer_sync_required = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
      })
      vim.cmd [[packadd packer.nvim]]
    end
    -- Compile whenver this file changes
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  local function setup_plugins(use)
    -- Package management
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use({
      "EdenEast/nightfox.nvim",
      config = function()
        vim.cmd "colorscheme nightfox"
      end,
    })

    -- Bootstrap packer if required
    if packer_sync_required then
      print("Restart Neovim for changes to take effect.")
      require("packer").sync()
    end
  end

  -- Initialize and start packer
  initialize_packer()
  local packer = require("packer")
  packer.init(packer_config)
  packer.startup(setup_plugins)

end

return M
