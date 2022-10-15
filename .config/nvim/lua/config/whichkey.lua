local M = {}

function M.setup()
  local whichkey = require("which-key")

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when CReating keymaps
    noremap = true, -- use `noremap` when CReating keymaps
    nowait = false, -- use `nowait` when CReating keymaps
  }

  local mappings = {
    ["w"] = { "<CMD>update!<CR>", "Save" },
    ["q"] = { "<CMD>q!<CR>", "Quit" },

    b = {
      name = "Buffer",
      c = { "<CMD>bd!<CR>", "Close current buffer" },
      D = { "<CMD>%bd|e#|bd#<CR>", "Delete all buffers" },
    },

    p = {
      name = "Packer",
      c = { "<CMD>PackerCompile<CR>", "Compile" },
      i = { "<CMD>PackerInstall<CR>", "Install" },
      s = { "<CMD>PackerSync<CR>", "Sync" },
      S = { "<CMD>PackerStatus<CR>", "Status" },
      u = { "<CMD>PackerUpdate<CR>", "Update" },
    },

    g = {
      name = "Git",
      s = { "<CMD>Neogit<CR>", "Status" },
    },
    f = {
      name = "Find",
      f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
      d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      r = { "<cmd>Telescope file_browser<cr>", "Browser" },
      w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      e = { "<CMD>NvimTreeToggle<CR>", "File Explorer" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
