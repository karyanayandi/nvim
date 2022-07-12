local ok, cybu = pcall(require, "cybu")
if not ok then
  return
end
cybu.setup {
  position = {
    relative_to = "win", -- win, editor, cursor
    anchor = "topright", -- topleft, topcenter, topright,
  },
  display_time = 1750, -- time the cybu window is displayed
  style = {
    path = "relative", -- absolute, relative, tail (filename only)
    border = "rounded", -- single, double, rounded, none
    separator = " ", -- string used as separator
    prefix = "…", -- string used as prefix for truncated paths
    padding = 1, -- left & right padding in number of spaces
    hide_buffer_id = true,
    devicons = {
      enabled = true, -- enable or disable web dev icons
      colored = true, -- enable color for web dev icons
    },
  },
}
vim.keymap.set("n", "H", "<Plug>(CybuPrev)")
vim.keymap.set("n", "L", "<Plug>(CybuNext)")
