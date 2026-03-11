-- set up tab and spaces.
-- we need to use vim.cmd so lua is able to recognize vim commands.

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set foldlevel=20")
vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set foldcolumn=1")

-- set leader key
vim.g.mapleader = " "

-- set relative numbers
vim.wo.relativenumber = true
vim.opt.laststatus = 3

-- make gf work better for project and library source/header navigation
vim.opt.path:append("**")
vim.opt.suffixesadd:append({ ".h", ".hpp", ".hh", ".hxx", ".c", ".cc", ".cpp", ".cxx" })
