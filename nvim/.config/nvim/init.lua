vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 4

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.cmd("colorscheme base16-default-dark")
-- vim.cmd("colorscheme base16-grayscale-light")

vim.opt.visualbell = false

-- Use 'gx' to open an item under the cursor in the default application
vim.g.netrw_browsex_viewer = "xdg-open"

-- Auto commands
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "nix",
    callback = function(ev)
	vim.o.shiftwidth = 2;
	vim.o.softtabstop = 2;
    end
})

-- Perforce commit messages
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = '/tmp/tmp.[0-9]*.[0-9]*.[0-9]*',
    callback = function(ev)
	vim.o.filetype = 'perforce';
    end
})
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "perforce",
    callback = function(ev)
	vim.o.shiftwidth = 8;
	vim.o.softtabstop = 0;
	vim.o.expandtab = false;
    end
})

-- Keymaps
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

-- Perforce - https://github.com/ngemily/vim-vp4/blob/master/doc/vp4.txt
vim.keymap.set("n", "<leader>pa", ":Vp4Annotate<CR>")
vim.keymap.set("n", "<leader>pc", ":Vp4Change<CR>")
vim.keymap.set("n", "<leader>pd", ":Vp4Diff<CR>")
vim.keymap.set("n", "<leader>pe", ":Vp4Edit<CR>")
vim.keymap.set("n", "<leader>pl", ":Vp4Filelog<CR>")
vim.keymap.set("n", "<leader>pr", ":Vp4Reopen<CR>")
vim.keymap.set("n", "<leader>p<return>", ":Vp4 describe <cword><CR>")

-- FZF
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>')
vim.keymap.set('n', '<leader>fc', ':Colors<CR>')
vim.keymap.set('n', '<leader>ff', ':Files<CR>')

-- LSP -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
