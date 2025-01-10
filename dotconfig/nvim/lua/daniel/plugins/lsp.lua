return {
    -- LSP ZERO
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },

    {
        'L3MON4D3/LuaSnip',
        config = function()
            local ls = require('luasnip')
            local s = ls.snippet
            local i = ls.insert_node
            local t = ls.text_node

            ls.add_snippets("python", {
                s("defini", {
                    t"def __init__(self", i(1), t") -> None:",
                    t({"", "\tpass"}), i(0)
                }),
                s("def", {
                    t"def ", i(1, "function_name"), t"(self, ", i(2, "parameters"), t") -> ", i(3, "return_type"),
                    t({":", "\t"}), i(0, "pass")
                }),
            })

        end
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        -- event = 'InsertEnter',
        dependencies = {
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()
            vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'buffer', keyword_length = 3 },
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Replace }),
                    ['<C-e>'] = cmp_action.toggle_completion(),
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-g>'] = function()
                        if cmp.visible_docs() then
                            cmp.close_docs()
                        else
                            cmp.open_docs()
                        end
                    end,
                    -- ['<C-l'] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         return cmp.complete_common_string()
                    --     end
                    --     fallback()
                    -- end, {'i', 'c'}),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                view = {
                    docs = {
                        auto_open = false
                    }
                },
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                experimental = {
                    ghost_text = true,
                }
            })
        end
    },
    -- LSP Support
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.preset('recommended')

            vim.opt.signcolumn = 'yes'

            lsp_zero.set_sign_icons({
                error = '✘',
                warn = '▲',
                hint = '⚑',
                info = '»'
            })

            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() vim.fn.feedkeys("zz") end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() vim.fn.feedkeys("zz") end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format({async = false, timeout_ms = 10000 }) end, opts)
                vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)

                vim.keymap.set("n", "<leader>vl", function() require('lint').try_lint() end, opts)
                vim.keymap.set("n", "<leader>vlq", function() vim.diagnostic.setqflist() end, opts)
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                },
            })

            -- lsp_zero.setup()

            -- vim.diagnostic.config({
            --     virtual_text = true,
            --     underline = true,
            --     float = {
            --         style = 'minimal',
            --         border = 'rounded',
            --         source = 'always',
            --         header = '',
            --         prefix = '',
            --     },
            -- })

        end
    },

    -- LINTER
    {
        'mfussenegger/nvim-lint',
        config = function()
            local lint = require('lint')

            lint.linters_by_ft = {
                python = {'mypy'},
                php = {'phpstan'},
                rust = {'bacon-ls'}
            }
        end
    }

    -- Autocompletion
    -- {'hrsh7th/cmp-path'},
    -- {'saadparwaiz1/cmp_luasnip'},

    -- Snippets
    -- {'rafamadriz/friendly-snippets'},
}
