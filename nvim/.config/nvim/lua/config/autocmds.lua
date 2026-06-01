-- C++ indent rules
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.bo.shiftwidth = 8
    vim.bo.softtabstop = 8
  end,
})

-- Nix typically uses 2-space indents
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})

-- Perforce: p4 change / p4 submit often open a temp file for the changelist description
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "/tmp/tmp.[0-9]*.[0-9]*.[0-9]*",
  callback = function()
    vim.bo.filetype = "perforce"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "perforce",
  callback = function()
    vim.bo.shiftwidth = 8
    vim.bo.softtabstop = 0
    vim.bo.expandtab = false
  end,
})

-- vim-vp4 uses the `p4` CLI; ensure P4PORT, P4CLIENT, P4USER (etc.) are set in your shell.
