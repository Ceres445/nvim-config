vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = '120'


if os.getenv('DISTRO') == 'Arch' then
    vim.g.python3_host_prog = '/usr/bin/python'
else if os.getenv('DISTRO') == 'Ubuntu' then
    vim.g.python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
else if os.getenv('DISTRO') == 'macos' then
    vim.g.python3_host_prog = '/usr/local/bin/python3'
end
end
end
