-- Disable netrw in favor of oil.nvim (see lua/plugins/ui.lua)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.opt.visualbell = false

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300

if vim.fn.executable("fd") == 1 then
  vim.env.FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --exclude .git"
end
