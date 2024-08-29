return {
	{ "akinsho/toggleterm.nvim", version = "*",
  config = function()
  local config  = require("toggleterm")
  config.setup({
			open_mapping = [[C-t]],
			hide_numbers = true,
  })
  end
  }
}



