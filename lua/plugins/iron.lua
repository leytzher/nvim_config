return {
  'Vigemus/iron.nvim',
  keys = {
    { "<leader>rs", "<cmd>IronRepl<cr>", desc = "Initialize REPL" },
    { "<leader>rr", "<cmd>IronRestart<cr>", desc = "Restart REPL" },
    { "<leader>rf", "<cmd>IronFocus<cr>", desc = "Focus REPL" },
    { "<leader>rh", "<cmd>IronHide<cr>", desc = "Hide REPL" },
  },
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        -- Whether a nr or a set of symbols are used to identify a REPL 
        scratch_repl = true,
        -- The window options for the REPL
        repl_definition = {
          sh = { command = { "zsh" } },
          python = {
            command = { "python3" },
            format = require("iron.fts.python").ipython,
          },
        },
        -- How the REPL window is displayed
        repl_open_cmd = require("iron.view").right("30%"),
      },
      -- Keybindings for sending data to the REPL
      keymaps = {
        send_motion = "<leader>sc",
        visual_send = "<leader>sc",
        send_file = "<leader>sf",
        send_line = "<leader>sl",
        send_until_cursor = "<leader>su",
        send_mark = "<leader>sm",
        mark_motion = "<leader>mc",
        mark_visual = "<leader>mc",
        remove_mark = "<leader>md",
        cr = "<leader>s<cr>",
        interrupt = "<leader>s<leader>",
        exit = "<leader>sq",
        clear = "<leader>cl",
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can highlight and send with the mappings above.
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
}
