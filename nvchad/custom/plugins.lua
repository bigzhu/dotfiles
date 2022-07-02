return {
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("null-ls").setup {
        debug = true,
        -- format on save
        --on_attach = function(client)
        --  if client.server_capabilities.document_formatting then
        --    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })"
        --  end
        --end,

        sources = {
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.diagnostics.eslint,
          require("null-ls").builtins.completion.spell,
        },
        -- format on save
        on_attach = function()
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })"
        end,
        -- you can reuse a shared lspconfig on_attach callback here
        --on_attach = function(client, bufnr)
        --  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        --  if client.supports_method("textDocument/formatting") then
        --    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        --    vim.api.nvim_create_autocmd("BufWritePre", {
        --      group = augroup,
        --      buffer = bufnr,
        --      callback = function()
        --        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        --        vim.lsp.buf.format({ bufnr = bufnr })
        --      end,
        --    })
        --  end
        --end,
      }
    end,
  },
}

-- load it after nvim-lspconfig cuz we lazy loaded lspconfig
