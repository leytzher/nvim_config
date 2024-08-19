-- set up tab and spaces.
-- we need to use vim.cmd so lua is able to recognize vim commands.

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- set leader key
vim.g.mapleader = " "

-- set relative numbers
vim.wo.relativenumber = true
