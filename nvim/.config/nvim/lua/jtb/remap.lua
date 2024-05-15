vim.g.mapleader = " "

vim.keymap.set("n", "<leader>je", vim.cmd.Ex)	-- Open netrw
vim.keymap.set("n", "<leader>jl", "<Cmd>cd %:h<CR>")

-- Move visually selected lines up or down with J/K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- <Leader>y to use the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>w", function()
    vim.opt.wrap = not(vim.opt.wrap:get());
end)

-- Disable 'Q' (Ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>")

-- Search and replace the word under the cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")


