--- Mason takes care of LSP
return {
  {
    "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
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
          "asm_lsp",
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
          "htmx",
          "eslint",
          "tsserver",
          "jsonls",
          "grammarly",
          "jedi_language_server",
          "svelte",
          "zls",
        }
    })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      -- Establish communication between lsp and neovim using lspconfig
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.clangd.setup({capabilities = capabilities})
      lspconfig.tsserver.setup({capabilities = capabilities})
      lspconfig.clojure_lsp.setup({capabilities = capabilities})
      lspconfig.arduino_language_server.setup({capabilities = capabilities})
      lspconfig.cssls.setup({capabilities = capabilities})
      lspconfig.tailwindcss.setup({capabilities = capabilities})
      lspconfig.docker_compose_language_service.setup({capabilities = capabilities})
      lspconfig.dockerls.setup({capabilities = capabilities})
      lspconfig.fortls.setup({capabilities = capabilities})
      lspconfig.gopls.setup({capabilities = capabilities})
      lspconfig.hls.setup({capabilities = capabilities})
      lspconfig.html.setup({capabilities = capabilities})
      lspconfig.htmx.setup({capabilities = capabilities})
      lspconfig.eslint.setup({capabilities = capabilities})
      lspconfig.jsonls.setup({capabilities = capabilities})
      lspconfig.grammarly.setup({capabilities = capabilities})
      lspconfig.jedi_language_server.setup({capabilities = capabilities})
      lspconfig.svelte.setup({capabilities = capabilities})
      lspconfig.zls.setup({capabilities = capabilities})

      -- use Shift+K to show info of symbol under cursor in a floating window 
      vim.keymap.set('n','K', vim.lsp.buf.hover, {})
      -- use gd to go to definition
      vim.keymap.set('n','gd', vim.lsp.buf.definition, {})
      -- use <space>ca for code actions in visual and normal mode
      vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },

}
