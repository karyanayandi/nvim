local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

local icons = require "user.icons"

local error_red = "#F44747"
local warning_orange = "#ff8800"
local hint_blue = "#4FC1FF"
local perf_purple = "#7C3AED"
local note_green = '#10B981'

todo_comments.setup {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = icons.ui.Bug,
      color = error_red,
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      signs = false,
    },
    TODO = { icon = icons.ui.Check, color = hint_blue, alt = { "TIP" } },
    HACK = { icon = icons.ui.Fire, color = warning_orange },
    WARN = { icon = icons.diagnostics.Warning, color = warning_orange, alt = { "WARNING", "XXX" } },
    PERF = { icon = icons.ui.Dashboard, color = perf_purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "TEST" } },
    NOTE = { icon = icons.ui.Note, color = note_green, alt = { "INFO" } },
  },
  highlight = {
    before = "",
    keyword = "wide",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400,
    exclude = { "markdown" },
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
