--- replacement of null-ls.
--- it handles linting and formatting
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- we need to install formatters from Mason
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        --null_ls.builtins.diagnostics.eslint_d,
      },
    })
    -- call format from the builtin lsp client from neovim
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
