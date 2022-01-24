local M = {}

M.format  = function()
    if (vim.bo.filetype == 'python')
    then
        vim.cmd(':Black')
    else
        vim.cmd(':Autoformat')
    end
end



M.load = function()
    local paths = vim.split(vim.fn.glob('~/.config/nvim/lua/*/*lua'), '\n')

    for _, file in pairs(paths) do
        print(file)
        vim.cmd('source ' .. file)
    end
    paths = vim.split(vim.fn.glob('~/.config/nvim/plugin/*vim'), '\n')
    for _, file in pairs(paths) do
        print(file)
        vim.cmd('source ' .. file)
    end
end


M.commit = function()
    vim.cmd("Git commit -am \"" .. vim.fn.input('Commit message: ') .. "\"")
end


M.tree = {}
M.tree.open = function (file_find)
    require'bufferline.state'.set_offset(31, 'FileTree')
    if file_find then
        require'nvim-tree'.find_file(true)
    else
        require'nvim-tree'.open()
    end
end

M.tree.close = function ()
    require'bufferline.state'.set_offset(0)
    require'nvim-tree'.close()
end

M.tree.toggle = function(file_find)
    if not require('nvim-tree.view').win_open() then
        M.tree.open(file_find)
    else
        M.tree.close()
    end
end
return M
