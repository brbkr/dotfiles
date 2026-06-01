return {
  { "RRethy/base16-nvim", lazy = true },
  { "vpoltora/cursor-light.nvim", lazy = true },
  {
    "oskarnurm/koda.nvim",
    lazy = true,
    config = function()
      require("koda").setup()
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("mellifluous").setup({})
      vim.cmd.colorscheme("mellifluous")
    end,
  },
}
