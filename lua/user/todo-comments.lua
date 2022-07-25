local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

local icons = require "user.icons"

local error_red = "#BF616A"
local warning_orange = "#D08770"
local info_yellow = "#EBCB8B"
local hint_blue = "#88C0D0"
local perf_purple = "#B48EAD"

todo_comments.setup {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = icons.ui.Bug,
      color = error_red,
      alt = { "FIX", "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = icons.ui.Check, color = hint_blue, alt = { "TIP" } },
    HACK = { icon = icons.ui.Fire, color = warning_orange },
    WARN = { icon = icons.diagnostics.Warning, color = warning_orange, alt = { "WARNING", "XXX" } },
    PERF = { icon = icons.ui.Dashboard, color = perf_purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = icons.ui.Note, color = info_yellow, alt = { "INFO" } },
  },
  highlight = {
    before = "",
    keyword = "fg",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400,
    exclude = {},
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  },
}
