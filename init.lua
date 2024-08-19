
-- install Lazy. 
-- it will check if lazy is installed; if not, then it will fetch it from github.
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then 
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-- vim options
require("vim-options")

-- load Lazy. It will read all our plugins from lua/plugins.lua 
require("lazy").setup("plugins")

-- set keymap for neo-tree 

