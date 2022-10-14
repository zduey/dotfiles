local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- 
keymap("n", "<C-h>", "<C-w><C-h>", default_opts)
keymap("n", "<C-j>", "<C-w><C-j>", default_opts)
keymap("n", "<C-k>", "<C-w><C-k>", default_opts)
keymap("n", "<C-l>", "<C-w><C-l>", default_opts)

-- Visual scrolling
keymap("n", "<Up>", "<C-y>", default_opts)
keymap("n", "<Down>", "<C-e>", default_opts)
keymap("n", "<Left>", "zh", default_opts)
keymap("n", "<Right>", "zl", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)
