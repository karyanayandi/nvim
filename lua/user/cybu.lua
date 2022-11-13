local ok, cybu = pcall(require, "cybu")
if not ok then
  return
end

cybu.setup {
  position = {
    relative_to = "win",
    anchor = "topright",
  },
  display_time = 1750,
  style = {
    path = "relative",
    border = "rounded",
    separator = " ",
    prefix = "…",
    padding = 1,
    hide_buffer_id = true,
    devicons = {
      enabled = true,
      colored = true,
    },
  },
}

vim.keymap.set("n", "H", "<Plug>(CybuPrev)")
vim.keymap.set("n", "L", "<Plug>(CybuNext)")
