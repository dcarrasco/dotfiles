return {
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'L3MON4D3/LuaSnip',
        config = function()
            local ls = require('luasnip')
            local s = ls.snippet
            local i = ls.insert_node
            local t = ls.text_node

            ls.add_snippets("python", {
                s("defini", {
                    t("def __init__(self"), i(1, ", parameters"), t({") -> None:", "\t"}), i(2, "pass"), t({"", ""})
                }),
                s("def", {
                    t("def "), i(1, "function_name"), t("(self, "), i(2, "parameters"), t(") -> "), i(3, "return_type"),
                    t({":", "\t"}), i(4, "pass"), t({"", ""})
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
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                    { name = 'buffer', keyword_length = 3 },
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Replace }),
                    -- ['<C-e>'] = cmp_action.toggle_completion(),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<C-r>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
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

            vim.opt.signcolumn = 'yes'
            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover, { border = 'rounded' }
            )
            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signature_help, { border = 'rounded' }
            )
            vim.diagnostic.config({
                float = { border = 'rounded' },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '',
                        [vim.diagnostic.severity.WARN] = '',
                        [vim.diagnostic.severity.HINT] = '⚑',
                        [vim.diagnostic.severity.INFO] = '',
                    },
                },
            })
        end
    },
    -- Autocompletion
    -- {'hrsh7th/cmp-path'},
    -- {'saadparwaiz1/cmp_luasnip'},
}
