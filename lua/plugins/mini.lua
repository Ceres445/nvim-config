-- require("mini.sessions").setup {
--     autoread = true,
--     autowrite = true,
--     verbose = { read = true },
--     hooks = {
--         pre = {
--             write = function()
--                 vim.cmd "NvimTreeClose"
--             end,
--         },
--     },
-- }
require("mini.visits").setup()
require("mini.fuzzy").setup()


require("mini.surround").setup {
    search_method = "cover_or_next",
}
require("mini.jump").setup {
    delay = {
        highlight = 100,
        idle_stop = 5000,
    },
}
return {}
