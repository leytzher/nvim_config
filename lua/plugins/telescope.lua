----- Telescope
  return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      -- setup variables for telescope
      local builtin =  require("telescope.builtin")
      --
      -- setup C-p to fuzzy find files in our directory
      vim.keymap.set('n', '<C-p>', builtin.find_files,{})
      -- do live grep
      vim.keymap.set('n', '<leader>fg', builtin.live_grep,{})
      -- find files
      vim.keymap.set('n', '<leader>ff', builtin.find_files,{})
      -- find buffers
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      -- find help tags
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end

  },

  {
   'nvim-telescope/telescope-ui-select.nvim',

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
