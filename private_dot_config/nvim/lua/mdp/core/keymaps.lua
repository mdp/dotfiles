-- set leader key to space
vim.g.mapleader = ";"

local keymap = vim.keymap -- for conciseness
local api = vim.api

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>ts", "<cmd>ToggleTerm<CR>", { desc = "Toggle Split Term on bottom" }) -- close current split window

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--
-- Terminal mappings
api.nvim_command("autocmd TermOpen * startinsert")             -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber")       -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column
api.nvim_command("autocmd TermEnter * startinsert") -- always live in insert mode

-- Escape terminal mode and back a buffer
keymap.set('t', '<C-^>', "<C-\\><C-n><C-^>", { desc = "Escape terminal mode and back a buffer" })
keymap.set('t', '<C-w><C-w>', "<C-\\><C-n><C-w><C-w>", { desc = "Escape terminal go to last pane" })
keymap.set('t', '<C-w>k', "<C-\\><C-n><C-w><C-k>", { desc = "Escape terminal go to up pane" })
keymap.set('t', '<C-w>h', "<C-\\><C-n><C-w><C-h>", { desc = "Escape terminal go to left pane" })
keymap.set('t', '<C-w>j', "<C-\\><C-n><C-w><C-j>", { desc = "Escape terminal go to down pane" })
