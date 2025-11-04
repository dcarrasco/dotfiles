local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
    keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)

    keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    keymap.set("n", "[d", function() vim.diagnostic.goto_prev() vim.fn.feedkeys("zz") end, opts)
    keymap.set("n", "]d", function() vim.diagnostic.goto_next() vim.fn.feedkeys("zz") end, opts)
    keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    keymap.set("n", "<leader>vf", function() vim.lsp.buf.format({async = false, timeout_ms = 10000 }) end, opts)
    keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)

    keymap.set("n", "<leader>vl", function() require('lint').try_lint() end, opts)
    keymap.set("n", "<leader>vlq", function() vim.diagnostic.setqflist() end, opts)
  end
})
