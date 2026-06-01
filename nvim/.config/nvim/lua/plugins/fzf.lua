return {
  {
    "junegunn/fzf",
    build = "./install --bin",
    init = function()
      vim.g.fzf_layout = { down = "~40%" }
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },
}
