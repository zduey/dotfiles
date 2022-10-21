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
opt.backspace = "indent,eol,start" -- Backspace over these areas
opt.breakindent = true -- Visaully indent automatically broken lines
opt.completeopt = "menuone,noselect,menu" -- Completion options
opt.concealcursor = "n"
opt.conceallevel = 2
opt.cursorlineopt = "number"
opt.diffopt = "internal,filler,closeoff,algorithm:patience" -- Diff mode options
opt.expandtab = true -- Replace <TAB> with appropriate number of spaces
opt.fillchars = "fold: ,foldclose:,foldopen:,foldsep: ,diff: ,eob: "
opt.fixendofline = false -- Do not automatically add EOL at end of line
opt.foldmethod = "expr" -- Use custom folding based on vim_treesitter
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.formatoptions = "lnjqr" -- Automatic formatting
opt.guicursor = ""
opt.inccommand = "split"
opt.laststatus = 3
opt.linebreak = true -- Wrap long lines
opt.mouse = "a" -- Allow mouse usage
opt.scrolloff = 10 -- Min number of lines above and below current line
opt.shiftwidth = 0
opt.showmode = false -- No message on last line
opt.spelloptions = "noplainbuffer" -- When to have spellcheck
opt.splitbelow = true -- Allow split windows to go below current (vertical)
opt.splitright = true -- Allow split windows to go to the right (horizontal)
opt.switchbuf = "useopen"
opt.tabstop = 2 -- Default number of spaces for <TAB>
opt.textwidth = 120 -- Max number of characters per line
opt.undodir = vim.fn.expand("~/.cache/nvim/undodir") -- Where to store 
opt.undofile = true
opt.viewoptions = "cursor,folds,slash,unix"
opt.spell = true -- turn on spell check
opt.spelllang = { "en_us" } -- set spellcheck language to US English

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
