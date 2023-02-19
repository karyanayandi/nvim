local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup {
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "css",
    "html",
    "astro",
    "lua",
  },
  user_default_options = {
    rgb_fn = true,
    tailwind = "both",
  },
  buftypes = {},
}
