vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "nix",
    callback = function(ev)
	vim.o.shiftwidth = 2;
	vim.o.softtabstop = 2;
    end
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     pattern = "python",
--     callback = function(ev)
-- 	require'lspconfig'.pyright.setup{}
--     end
-- })

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
