return {
  "karyanayandi/onenord.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("onenord").setup {
      theme = "dark",
      borders = true,
      fade_nc = false,
      styles = {
        comments = "NONE",
        strings = "NONE",
        keywords = "NONE",
        functions = "italic",
        variables = "NONE",
        diagnostics = "underline",
      },
      disable = {
        background = false,
        cursorline = false,
        eob_lines = true,
      },
      inverse = {
        match_paren = false,
      },
      custom_highlights = {},
      custom_colors = {},
    }
  end,
}
