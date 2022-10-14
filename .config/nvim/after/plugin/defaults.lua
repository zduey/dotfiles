local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- General options
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.timeoutlen = 300 -- time to wait for mapped sequence to complete
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.backspace = "indent,eol,start"
opt.breakindent = true
opt.completeopt = "menuone,noselect,menu"
opt.concealcursor = "n"
opt.conceallevel = 2
opt.cursorlineopt = "number"
opt.diffopt = "internal,filler,closeoff,algorithm:patience"
opt.expandtab = true
opt.fillchars = "fold: ,foldclose:,foldopen:,foldsep: ,diff: ,eob: "
opt.fixendofline = false
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.formatoptions = "lnjqr"
opt.guicursor = ""
opt.inccommand = "split"
opt.laststatus = 3
opt.linebreak = true
opt.mouse = "a"
opt.scrolloff = 10
opt.shiftwidth = 0
opt.showmode = false
opt.smartcase = true
opt.spelloptions = "noplainbuffer"
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = "useopen"
opt.tabstop = 2
opt.textwidth = 120
opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")
opt.undofile = true
opt.viewoptions = "cursor,folds,slash,unix"

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

