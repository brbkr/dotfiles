local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

map("n", "<leader>je", function()
  require("oil").open()
end, { desc = "Open file explorer (oil)" })

map("n", "<leader>jl", "<cmd>cd %:h<CR>", { desc = "cd to file directory" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })
map("v", "<leader>Y", '"+Y', { desc = "Yank selection to clipboard (line)" })

map("n", "<leader>w", function()
  vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle wrap" })

map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

map("n", "<C-n>", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "<C-p>", "<cmd>cprev<CR>", { desc = "Previous quickfix" })

map(
  "n",
  "<leader>s",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Replace word under cursor" }
)

-- Perforce — https://github.com/ngemily/vim-vp4/blob/master/doc/vp4.txt
map("n", "<leader>pa", "<cmd>Vp4Annotate<CR>", { desc = "Vp4 annotate" })
map("n", "<leader>pc", "<cmd>Vp4Change<CR>", { desc = "Vp4 change" })
map("n", "<leader>pd", "<cmd>Vp4Diff<CR>", { desc = "Vp4 diff" })
map("n", "<leader>pe", "<cmd>Vp4Edit<CR>", { desc = "Vp4 edit" })
map("n", "<leader>pl", "<cmd>Vp4Filelog<CR>", { desc = "Vp4 filelog" })
map("n", "<leader>pr", "<cmd>Vp4Reopen<CR>", { desc = "Vp4 reopen" })
map("n", "<leader>p<cr>", "<cmd>Vp4 describe <cword><CR>", { desc = "Vp4 describe word" })

-- FZF
map("n", "<leader>fb", "<cmd>Buffers<CR>", { desc = "FZF buffers" })
map("n", "<leader>fc", "<cmd>Colors<CR>", { desc = "FZF colorschemes" })
map("n", "<leader>ff", "<cmd>Files<CR>", { desc = "FZF files" })
