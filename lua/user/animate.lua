local status_ok, animate = pcall(require, "mini.animate")
if not status_ok then
  return
end

local mouse_scrolled = false
for _, scroll in ipairs { "Up", "Down" } do
  local key = "<ScrollWheel" .. scroll .. ">"
  vim.keymap.set({ "", "i" }, key, function()
    mouse_scrolled = true
    return key
  end, { expr = true })
end

animate.setup {
  resize = {
    timing = animate.gen_timing.linear { duration = 100, unit = "total" },
  },
  scroll = {
    timing = animate.gen_timing.linear { duration = 150, unit = "total" },
    subscroll = animate.gen_subscroll.equal {
      predicate = function(total_scroll)
        if mouse_scrolled then
          mouse_scrolled = false
          return false
        end
        return total_scroll > 1
      end,
    },
  },
}
