local M = {}

function M.setup ()

  local packer_sync_required  = false

  local packer_config = {
    profile = {
      enable = true,
      threshold = 1,
    },
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

    -- Lua-based helpers
    use("nvim-lua/plenary.nvim")

    -- Colorscheme
    use({
      "EdenEast/nightfox.nvim",
      config = function()
        vim.cmd "colorscheme nightfox"
      end,
    })

    -- Key mapping help
    use({
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end,
    })

    -- Notifications
    use({
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function()
        vim.notify = require("notify")
      end,
    })

    -- Improved icons
    use({
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup({ default = true })
      end,
    })

    -- Better file explorer
    use({
      "kyazdani42/nvim-tree.lua",
      wants = "nvim-web-devicons",
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("config.nvimtree").setup()
      end,
    })

    -- Markdown preview
    use({
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
    })

    -- Diffview
    use({
      "sindrets/diffview.nvim",
      requires = "nvim-lua/plenary.nvim"
    })

    -- Git
  	use({
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
    })

    -- Bootstrap packer if required
    if packer_sync_required then
      require("notify")("Restart Neovim for changes to take effect.")
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
