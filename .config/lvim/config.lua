-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"

-- options
vim.opt.relativenumber = true -- set relative numbered lines

-- keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- neotest-related mappings
lvim.builtin.which_key.mappings["n"] = {
  name = "Neotest",
  a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
  f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
  F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
  l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
  L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
  n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
  N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
  o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
  S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
  s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },

}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "markdown",
  "markdown_inline"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } }
})

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } }
}

-- Additional Plugins
lvim.plugins = {
  -- manage git in a tab
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  -- test runner
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")
        }
      })
    end
  },
  -- quarto
  {
    'quarto-dev/quarto-nvim',
    requires = {
      'jmbuhr/otter.nvim',
      'neovim/nvim-lspconfig'
    },
    config = function()
      require('quarto').setup {
        lspFeatures = {
          enabled = true,
          languages = { 'r', 'python', 'julia' },
          diagnostics = {
            enabled = true,
            triggers = { "BufWrite" }
          },
          completion = {
            enabled = true
          }
        }
      }
    end
  }
}

-- Update completion settings
table.insert(lvim.builtin.cmp.sources, 1, { name = "otter" })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
