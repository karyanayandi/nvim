local status_ok, onenord = pcall(require, "onenord")
if not status_ok then
  return
end

onenord.setup {
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
