return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "jose-elias-alvarez/typescript.nvim" },
    { "folke/neoconf.nvim",                cmd = "Neoconf",                                config = true },
    { "folke/neodev.nvim",                 opts = { experimental = { pathStrict = true } } },
  },
  lazy = true,
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    config = function()
      require "lsp.mason"
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = function()
      require "lsp.null-ls"
    end,
  },
  { "b0o/SchemaStore.nvim" },
  { "jose-elias-alvarez/typescript.nvim" },
}
