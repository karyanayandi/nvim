local colorscheme = "onenord"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

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
