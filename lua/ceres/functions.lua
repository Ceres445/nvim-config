local M = {}

M.format = function()
    if (vim.bo.filetype == 'python')
    then
        vim.cmd(':Black')
    elseif (vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript")
    then
        vim.cmd(":Prettier")
    else
        if vim.fn.exists(':Format') then
            vim.cmd(':Format')
            vim.cmd(":w")
        end
        -- vim.cmd(":!indent %")

    end
end

M.dump = function(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. M.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


M.toggle_errors = function()
    if (vim.g.errors_visible) then
        vim.g.errors_visible = false
        vim.diagnostic.config({ virtual_lines = false })
        print("Disabled errors")
    else
        vim.g.errors_visible = true
        vim.diagnostic.config({ virtual_lines = true })
        print("Enabled errors")
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
M.tree.open = function(file_find)
    require 'bufferline.state'.set_offset(31, 'FileTree')
    if file_find then
        require 'nvim-tree'.find_file(true)
    else
        require 'nvim-tree'.open()
    end
end

M.tree.close = function()
    require 'bufferline.state'.set_offset(0)
    require 'nvim-tree'.close()
end

M.tree.toggle = function(file_find)
    if not require('nvim-tree.view').win_open() then
        M.tree.open(file_find)
    else
        M.tree.close()
    end
end
return M
