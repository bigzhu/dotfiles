-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.
-- auto format when save

 vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })]]
