return {
  "epwalsh/obsidian.nvim",
  version = "*", --latest version
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local obsidian = require("obsidian")
    obsidian.setup({
      workspaces = { {
        name = "SecondBrain",
        --path = "~/Documents/vaults/2ndBrain",
        path = "/Users/leytzher/Documents/2ndBrain",
      } },
      completion = {
        nvim_cmp = true,
        min_chars = 2, -- completion at 2 chars.
        new_notes_location = "current_dir",
        prepend_note_id = true,
      },

      keys = {
        { "<leader>on", "<cmd>ObsidianNew<cr>",         desc = "New Obsidian Note",               mode = "n" },
        { "<leader>oo", "<cmd>ObsidianSearch<cr>",      desc = "Search Obsidian Note",            mode = "n" },
        { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch",                    mode = "n" },
        { "<leader>ob", "<cmd>ObsidianBackLinks<cr>",   desc = "Show location list of backlinks", mode = "n" },
        { "<leader>ot", "<cmd>ObsidianTemplate<cr>",    desc = "Insert Template",                 mode = "n" },
      },
      mappings = {
        -- "obsidian follow (of)"
        ["<leader>of"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- toggle check-boxes ("obsidian done (od)")
        ["<leader>od"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },

      -- frontmatter
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
        tags = "",
      },
    })
  end,
}
