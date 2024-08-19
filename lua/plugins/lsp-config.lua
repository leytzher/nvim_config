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
      local lspconfig = require("lspconfig")
      -- Establish communication between lsp and neovim using lspconfig
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.clojure_lsp.setup({})
      lspconfig.arduino_language_server.setup({})
      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.docker_compose_language_service.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.fortls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.hls.setup({})
      lspconfig.html.setup({})
      lspconfig.htmx.setup({})
      lspconfig.eslint.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.grammarly.setup({})
      lspconfig.jedi_language_server.setup({})
      lspconfig.svelte.setup({})
      lspconfig.zls.setup({})

      -- use Shift+K to show info of symbol under cursor in a floating window 
      vim.keymap.set('n','K', vim.lsp.buf.hover, {})
      -- use gd to go to definition
      vim.keymap.set('n','gd', vim.lsp.buf.definition, {})
      -- use <space>ca for code actions in visual and normal mode
      vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },

}
