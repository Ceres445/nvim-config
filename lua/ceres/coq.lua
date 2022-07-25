-- local coq = require("coq")
-- vim.g.coq_settings = {
--     auto_start = "shut-up",
-- }

-- local lsp_installer = require("nvim-lsp-installer")

-- -- Register a handler that will be called for all installed servers.
-- -- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.settings({
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--     }
-- })
-- lsp_installer.on_server_ready(function(server)
--     local opts = coq.lsp_ensure_capabilities()


--     if server.name == "gopls" then
--         opts.settings = {
--             gopls = {
--                 analyses = {
--                     unusedparams = true,
--                 },
--                 staticcheck = true,
--             },
--         }
--     elseif server.name == "sumneko_lua" then
--         opts.settings = coq.lsp_ensure_capabilities({
--             Lua = {
--                 diagnostics = {
--                     globals = { 'vim' }
--                 }
--             }})
--     end
--     server:setup(opts)
-- end)

