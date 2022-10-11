-- global
vim.g.mapleader = " "
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- commands
vim.cmd([[filetype plugin indent on]])

-- settings
local function set(opt, val)
  vim.opt[opt] = val
end

for opt, val in pairs({
  backspace = "indent,eol,start",
  breakindent = true,
  completeopt = "menuone,noselect,menu",
  concealcursor = "n",
  conceallevel = 2,
  cursorlineopt = "number",
  diffopt = "internal,filler,closeoff,algorithm:patience",
  expandtab = true,
  fillchars = "fold: ,foldclose:,foldopen:,foldsep: ,diff: ,eob: ",
  fixendofline = false,
  foldexpr = "nvim_treesitter#foldexpr()",
  foldlevel = 99,
  foldmethod = "expr",
  formatoptions = "lnjqr",
  guicursor = "",
  ignorecase = true,
  inccommand = "split",
  laststatus = 3,
  linebreak = true,
  mouse = "a",
  number = true,
  relativenumber = true,
  scrolloff = 10,
  shiftwidth = 0,
  showmode = false,
  signcolumn = "yes",
  smartcase = true,
  spelloptions = "noplainbuffer",
  splitbelow = true,
  splitright = true,
  switchbuf = "useopen",
  tabstop = 2,
  termguicolors = true,
  textwidth = 120,
  undodir = vim.fn.expand("~/.cache/nvim/undodir"),
  undofile = true,
  viewoptions = "cursor,folds,slash,unix",
  wrap = false,
}) do
  local suc, err = pcall(set, opt, val)
  if not suc then
    print("Error setting option " .. opt .. ": " .. err)
  end
end

-- Set up plugins
require("plugins")
