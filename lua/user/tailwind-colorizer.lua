local status_ok, tailwind_colorizer_cmp = pcall(require, "tailwindcss-colorizer-cmp")

if not status_ok then
  return
end

tailwind_colorizer_cmp.setup {
  color_square_width = 2,
}
