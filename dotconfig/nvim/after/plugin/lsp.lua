local lsp_zero = require('lsp-zero')

lsp_zero.preset('recommended')

-- lsp.ensure_installed({
-- 	'pylsp',
-- })

require('lint').linters_by_ft = {
    python = {'pylint', 'mypy'}
}

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
})

lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set("n", "<leader>vl", function() require('lint').try_lint() end, opts)
    vim.keymap.set("n", "<leader>vll", function()
        local file_name = vim.api.nvim_buf_get_name(0)
        print(file_name)
        -- local lint_command = 'mypy --strict ' .. file_name
        -- local handle = io.popen(lint_command)
        -- local result = handle:read("*a")
        -- handle:close()
        -- result:gsub("[\r\n]", " ")
        -- print(result)
        -- vim.cmd('cexpr ' .. result)
        -- vim.cmd('copen 5')
        -- print(os.execute('ls'))
        -- print(vim.api.nvim_buf_get_name(0))
    end, opts)

end)

lsp_zero.setup()

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls" },
    handlers = {
        lsp_zero.default_setup,
    }
})


