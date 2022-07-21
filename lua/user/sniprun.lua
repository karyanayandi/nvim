local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
  return
end

sniprun.setup {
  display = {
    "VirtualTextOk",
  },
  display_options = {
    terminal_width = 45,
    notification_timeout = 5,
  },
  show_no_output = {
    "Classic",
    "TempFloatingWindow",
  },
  inline_messages = 0,
  borders = "single",
}
