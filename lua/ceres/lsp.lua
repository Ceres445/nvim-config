-- Setup nvim-cmp.
local cmp = require'cmp'
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]",
    cmdline = "[Cmd]",
}

local lspkind = require('lspkind')

require('lspkind').init({
    with_text = true,
})

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping. */
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if menu then
                vim_item.menu = menu
            else
                vim_item.menu = "[Other]"
                print('undefined cmp source' .. entry.source.name)
            end
            return vim_item
        end
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = "luasnip" },
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Setup lspconfig.
local lspconfig = require'lspconfig'

-- lspconfig.pylsp.setup{
--     filetypes = {"python"},
--     settings = {
--         configurationSources = {"flake8"},
--         plugins = {
--             flake8 = {
--                 config = "~/.config/flake8",
--                 enabled = false,
--             },
--             pycodestyle = {enabled = false },
--         }
--     },
--     capabilities = capabilities
-- }

-- lspconfig.pyright.setup{
--     capabilities = capabilities
-- }

-- require'lspconfig'.jedi_language_server.setup{
--     capabilities = capabilities,
-- }

-- lspconfig.gopls.setup {
--     cmd = {"gopls", "serve"},
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             staticcheck = true,
--         },
--     },
--     capabilities = capabilities,
-- }

-- lspconfig.sumneko_lua.setup{
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     },
--     capabilities = capabilities
-- }

-- lspconfig.vimls.setup{
--     capabilities = capabilities
-- }
-- lspconfig.sqls.setup{
--     capabilities = capabilities
-- }
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
    }

    if server.name == "gopls" then
        opts.settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        }
    elseif server.name == "sumneko_lua" then
        opts.settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    end
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

vim.cmd [[nnoremap <silent>gca lua require'nvim-lightbulb'.update_lightbulb()<CR>]]

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

require("trouble").setup {
    mode= "quickfix"
}


