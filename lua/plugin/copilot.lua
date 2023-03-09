return {
  "zbirenbaum/copilot.lua",
  event = { "VimEnter" },
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup {
      cmp = {
        enabled = true,
        method = "getCompletionsCycling",
      },
      panel = {
        enabled = true,
      },
      ft_disable = { "markdown" },
      server_opts_overrides = {
        settings = {
          advanced = {
            inlineSuggestCount = 3,
          },
        },
      },
    }
  end,
}
