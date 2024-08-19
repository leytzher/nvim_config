
  -- Add catppuccin color scheme
  return { "catppuccin/nvim", 
          name = "catppuccin", 
          priority = 1000 ,
    -- configuration for catppuccin
  config = function()
    vim.cmd.colorscheme "catppuccin"
    end}
