----- Telescope
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jonarrien/telescope-cmdline.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				cmdline = {
					-- Custom cmdline configuration can be added here
					-- Example: picker = { layout_config = { width = 120, height = 25 } },
					-- mappings = { complete = '<Tab>', run_selection = '<C-CR>', run_input = '<CR>' },
					-- overseer = { enabled = true }
				},
			},
		})
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("cmdline")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>cm", ":Telescope cmdline<CR>", { noremap = true })
	end,
}
