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

-- C++ indent rules
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "cpp",
    callback = function(ev)
	vim.o.shiftwidth = 8;
	vim.o.softtabstop = 8;
    end
})

-- NIX typically uses 2-space indents
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "nix",
    callback = function(ev)
	vim.o.shiftwidth = 2;
	vim.o.softtabstop = 2;
    end
})

-- Perforce commit messages need real tabs
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
require('lspconfig').pyright.setup{}
require('lspconfig').clangd.setup{}
require('CopilotChat').setup{}
vim.keymap.set('n', 'grr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'grd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'grD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'grs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', 'grh', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'grm', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'grf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'grc', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'grl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
vim.keymap.set('n', 'grn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'grp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', 'grw', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
vim.keymap.set('n', 'grq', '<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>')
vim.keymap.set('n', 'grv', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
vim.keymap.set('n', 'grV', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

