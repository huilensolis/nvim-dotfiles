return {
    {
        'hrsh7th/nvim-cmp',
        event = { 'InsertEnter' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',   -- Buffer source for nvim-cmp
            'hrsh7th/cmp-path',     -- Path source for nvim-cmp
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local cmp = require('cmp')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                preselect = "item",
                completion = {
                    autocomplete = { cmp.TriggerEvent.TextChanged },
                    completeopt = 'menu,menuone,noinsert'
                },
                sources = {
                    { name = 'nvim_lsp', priority = 1000 }, -- Ensure this is prioritized
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'luasnip' },
                },
                mapping = cmp.mapping.preset.insert({
                    -- Navigate between completion items
                    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),

                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),
                    -- Navigate between snippet placeholder
                    -- ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
                    -- ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
            })
            print("nvim-cmp setup complete")
        end
    }
}
