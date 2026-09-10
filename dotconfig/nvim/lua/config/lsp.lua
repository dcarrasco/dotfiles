vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim', 'require', 'hl' } },
      telemetry = { enable = false },
    }
  }
})

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    prefix = "●",
    source = false,
  },
  jump = {
    float = true,
    on_jump = function ()
      vim.cmd("normal! zz")
    end
  },
  signs = {
    text = {
      --     ⚑   󰅙
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN]  = '',
      [vim.diagnostic.severity.HINT]  = '⚑',
      [vim.diagnostic.severity.INFO]  = '',
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { buffer = ev.buf, silent = true, desc = "LSP: " .. desc })
    end

    map("n", "gd", function() vim.lsp.buf.definition() end, "Show symbol definition")
    map("n", "gD", function() vim.lsp.buf.declaration() end, "Show symbol declaration")
    map("n", "go", function() vim.lsp.buf.type_definition() end, "Show type definition")
    map("n", "gr", function() vim.lsp.buf.references() end, "Show references")
    map("n", "gs", function() vim.lsp.buf.signature_help() end, "Show signature")
    map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, "Show workspace symbols")
    map("n", "<leader>vd", function() vim.diagnostic.open_float() end, "Open float diagnostic information")
    map("n", "<leader>vf", function() vim.lsp.buf.format({async = false, timeout_ms = 10000 }) end, "LSP Format")
    map("i", "<C-k>", function() vim.lsp.buf.signature_help() end, "Show signature help")

    map("n", "<leader>vl", function() require('lint').try_lint() end, "Lint buffer")
    map("n", "<leader>vlq", function() vim.diagnostic.setqflist() end, "Show linter diagnostic")

  end
})
