return {
	{ "akinsho/toggleterm.nvim", version = "*",
  config = function()
    local config  = require("toggleterm")
    config.setup({
        hide_numbers = true,
        open_mapping = [[<C-t>]],
        direction = "float",
        float_opts = {
          border = "curved",
          width = 100, 
          height = 30,
          winblend = 3,
        },
        shade_terminals = true, 
        start_in_insert = true, 
        insert_mappings = true, 
        terminal_mappings = true,
  })
  end,
  },
}


