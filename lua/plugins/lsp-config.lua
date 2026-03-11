--- Mason takes care of LSP
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- bridge with lspconfig
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- lsp's to be installed
				ensure_installed = {
					"lua_ls",
					"arduino_language_server",
					"clangd",
					"clojure_lsp",
					"cssls",
					"tailwindcss",
					"docker_compose_language_service",
					"dockerls",
					"fortls",
					"gopls",
					"hls",
					"html",
					"eslint",
					"jsonls",
					--"grammarly",
					"jedi_language_server",
					"svelte",
					"zls",
					          "ts_ls",
--					"tsserver",
					"fortls",
					"julials",
					--
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"lua_ls",
				"arduino_language_server",
				"clangd",
				"clojure_lsp",
				"cssls",
				"tailwindcss",
				"docker_compose_language_service",
				"dockerls",
				"fortls",
				"gopls",
				"hls",
				"html",
				"eslint",
				"jsonls",
				"jedi_language_server",
				"svelte",
				"zls",
				"ts_ls",
				"julials",
			}

			local clangd_cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--completion-style=detailed",
				"--header-insertion=never",
				"--fallback-style=llvm",
				"--query-driver=/usr/bin/clang++,/usr/bin/clang,/opt/homebrew/opt/llvm/bin/clang++,/opt/homebrew/opt/llvm/bin/clang,/opt/homebrew/bin/g++,/usr/bin/g++",
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, { capabilities = capabilities })
			end

			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = clangd_cmd,
				single_file_support = true,
			})

			vim.lsp.config("julials", {
				capabilities = capabilities,
				on_new_config = function(new_config, _)
					local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
					if vim.fn.filereadable(julia) == 1 then
						new_config.cmd[1] = julia
					end
				end,
			})

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end

			-- use Shift+K to show info of symbol under cursor in a floating window
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- use gd to go to definition
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- additional jumps for library/source navigation
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			-- use <space>ca for code actions in visual and normal mode
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- switch between .c/.cpp and .h/.hpp when clangd is active
			vim.keymap.set("n", "<leader>ch", function()
				if vim.fn.exists(":ClangdSwitchSourceHeader") == 2 then
					vim.cmd("ClangdSwitchSourceHeader")
				end
			end, {})
		end,
	},
}
