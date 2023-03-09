return {
  { "moll/vim-bbye" },
  { "wakatime/vim-wakatime" },
  { "folke/trouble.nvim" },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-lua/popup.nvim",
    lazy = true,
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },
}
