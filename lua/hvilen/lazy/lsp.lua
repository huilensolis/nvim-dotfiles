return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        dependencies = {
            'neovim/nvim-lspconfig',             -- LSP configurations
            'hrsh7th/nvim-cmp',                  -- Autocompletion plugin
            'hrsh7th/cmp-nvim-lsp',              -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',                -- Buffer completions
            'hrsh7th/cmp-path',                  -- Path completions
            'L3MON4D3/LuaSnip',                  -- Snippet engine
            'williamboman/mason.nvim',           -- LSP installer
            'williamboman/mason-lspconfig.nvim', -- Mason integration with lspconfig
        }
        ,
        config = function()
            local lsp_zero = require('lsp-zero')

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(client, bufnr)
                local opts = { buffer = bufnr }

                lsp_zero.buffer_autoformat()

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end

            lsp_zero.extend_lspconfig({
                sign_text = {
                    error = '✘',
                    warn = '▲',
                    hint = '⚑',
                    info = '»',
                },
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            lsp_zero.setup()
        end
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'rust_analyzer', 'ts_ls', 'biome', 'docker_compose_language_service' },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
                -- this is the "custom handler" for `example_server`
                ts_ls = function()
                    require('lspconfig').ts_ls.setup({
                        ---
                        -- in here you can add your own
                        -- custom configuration
                        ---
                    })
                end,
                rust_analyzer = function()
                    require('lspconfig').rust_analyzer.setup({
                        on_attach = function(client, bufnr)
                            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                        end,
                        capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Important for completion capabilities

                        settings = {
                            ["rust-analyzer"] = {
                                procMacro = { enable = true },
                                cargo = { allFeatures = true },
                                checkOnSave = { command = "clippy", extraArgs = { "--no-deps" } },
                            },
                        }
                    })
                end
            })
        end,
    },
    -- -- LSP
    -- {
    --     'neovim/nvim-lspconfig',
    --     cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    --     event = { 'BufReadPre', 'BufNewFile' },
    --     dependencies = {
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },
    --     },
    --     config = function()
    --         local lsp_zero = require('lsp-zero')
    --
    --         -- lsp_attach is where you enable features that only work
    --         -- if there is a language server active in the file
    --         local lsp_attach = function(client, bufnr)
    --             local opts = { buffer = bufnr }
    --
    --             lsp_zero.buffer_autoformat()
    --
    --             vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    --             vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    --             -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    --             -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    --             -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    --             -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    --             -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    --             -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    --             vim.keymap.set({ 'n', 'x' }, '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    --             vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    --         end
    --
    --         lsp_zero.extend_lspconfig({
    --             sign_text = {
    --                 error = '✘',
    --                 warn = '▲',
    --                 hint = '⚑',
    --                 info = '»',
    --             },
    --             lsp_attach = lsp_attach,
    --             capabilities = require('cmp_nvim_lsp').default_capabilities()
    --         })
    --         require('mason-lspconfig').setup({
    --             ensure_installed = { 'lua_ls', 'rust_analyzer', 'ts_ls', 'biome', 'docker_compose_language_service' },
    --             handlers = {
    --                 -- this first function is the "default handler"
    --                 -- it applies to every language server without a "custom handler"
    --                 function(server_name)
    --                     require('lspconfig')[server_name].setup({})
    --                 end,
    --             },
    --             -- this is the "custom handler" for `example_server`
    --             ts_ls = function()
    --                 require('lspconfig').ts_ls.setup({
    --                     ---
    --                     -- in here you can add your own
    --                     -- custom configuration
    --                     ---
    --                 })
    --             end,
    --             rust_analyzer = function()
    --                 require('lspconfig').rust_analyzer.setup({
    --                     on_attach = function(client, bufnr)
    --                         vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    --                     end,
    --                     capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Important for completion capabilities
    --
    --                     settings = {
    --                         ["rust-analyzer"] = {
    --                             procMacro = { enable = true },
    --                             cargo = { allFeatures = true },
    --                             checkOnSave = { command = "clippy", extraArgs = { "--no-deps" } },
    --                         },
    --                     }
    --                 })
    --             end
    --         })
    --     end
    -- }
}
