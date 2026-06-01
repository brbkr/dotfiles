return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      vim.lsp.config("clangd", {
        cmd = { "clangd", "--fallback-style=LLVM" },
      })
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(ev)
          local buf = ev.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc, silent = true })
          end

          map("n", "grr", vim.lsp.buf.references, "LSP references")
          map("n", "grd", vim.lsp.buf.definition, "LSP definition")
          map("n", "grD", vim.lsp.buf.declaration, "LSP declaration")
          map("n", "grt", vim.lsp.buf.type_definition, "LSP type definition")
          map("n", "grs", vim.lsp.buf.signature_help, "LSP signature help")
          map("n", "grh", vim.lsp.buf.hover, "LSP hover")
          map("n", "grm", vim.lsp.buf.implementation, "LSP implementation")
          map("n", "grf", function()
            vim.lsp.buf.format({ async = true })
          end, "LSP format")
          map("n", "grn", vim.lsp.buf.rename, "LSP rename")
          map("n", "grc", vim.lsp.buf.code_action, "LSP code action")
          map("n", "grl", function()
            vim.diagnostic.open_float()
          end, "Line diagnostics")
          map("n", "gr]", function()
            vim.diagnostic.goto_next()
          end, "Next diagnostic")
          map("n", "gr[", function()
            vim.diagnostic.goto_prev()
          end, "Previous diagnostic")
          map("n", "grw", function()
            vim.diagnostic.setloclist()
          end, "Diagnostics to loclist")
          map("n", "grq", function()
            vim.diagnostic.setqflist()
          end, "Diagnostics to quickfix")
          map("n", "grv", function()
            vim.lsp.buf.document_symbol()
          end, "Document symbols")
          map("n", "grV", function()
            vim.lsp.buf.workspace_symbol()
          end, "Workspace symbols")
        end,
      })
    end,
  },
}
