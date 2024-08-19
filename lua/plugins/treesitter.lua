return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",

  config = function()
  ------ Treesitter
  -- setup local variable for treesitter configuration
  local config = require("nvim-treesitter.configs")
  -- configure treesitter
  config.setup({
    auto_install = true,  -- treesitter will autoinstall if it doesn't have a parser for the language
    highlight = {enable = true},
    indent = {enable = true},
    })
  end
}
