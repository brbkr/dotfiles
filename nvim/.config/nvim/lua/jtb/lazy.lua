local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "junegunn/fzf",
  "RRethy/nvim-base16",
  "sainnhe/everforest",
  "rebelot/kanagawa.nvim",
  "rose-pine/neovim",
  "ramojus/mellifluous.nvim",
  "vim-utils/vim-man",
  "preservim/nerdtree",
  "ngemily/vim-vp4",
  { 'nvim-telescope/telescope.nvim', 
  	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim"
	}
  },
  "neovim/nvim-lspconfig",
})
