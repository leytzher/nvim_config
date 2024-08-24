return {
  -- Conjure!
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "python" }, -- etc
    lazy = true,
    init = function()
      vim.g.maplocalleader = ','
      -- vim.g["conjure#debug"] = true
    end,

    -- Optional cmp-conjure integration
    dependencies = { "PaterJason/cmp-conjure" },
  },
  {
    "PaterJason/cmp-conjure",
    lazy = true,
    config = function()
      local cmp = require("cmp")
      local config = cmp.get_config()
      table.insert(config.sources, { name = "conjure" })
      return cmp.setup(config)
    end,
  },
  {
  'guns/vim-sexp',
  },
  {
    'tpope/vim-sexp-mappings-for-regular-people',
  },
  {
    'tpope/vim-repeat',
  },
  {
    'tpope/vim-surround',
  },
}
