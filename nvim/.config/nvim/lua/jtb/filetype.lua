vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "nix",
    callback = function(ev)
	vim.o.shiftwidth = 2;
	vim.o.softtabstop = 2;
    end
})
