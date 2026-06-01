-- nvim-treesitter rewrite (Nvim 0.12+). Requires `tree-sitter` CLI on PATH.
-- Install CLI: scripts/install-tree-sitter-cli.sh
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local cargo_bin = vim.fs.joinpath(vim.env.HOME, ".cargo", "bin")
      if vim.fn.isdirectory(cargo_bin) == 1 and not vim.env.PATH:find(cargo_bin, 1, true) then
        vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
      end

      local install_dir = vim.fs.normalize(vim.fn.stdpath("data") .. "/site")
      require("nvim-treesitter").setup({ install_dir = install_dir })

      if vim.fn.executable("tree-sitter") ~= 1 then
        vim.notify(
          "tree-sitter CLI not on PATH — run :checkhealth nvim-treesitter\n"
            .. "Install: ~/.config/nvim/scripts/install-tree-sitter-cli.sh",
          vim.log.levels.WARN
        )
      end
    end,
  },
}
