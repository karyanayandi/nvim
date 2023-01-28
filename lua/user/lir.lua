local status_ok, lir = pcall(require, "lir")
if not status_ok then
  return
end

local actions = require "lir.actions"
local mark_actions = require "lir.mark.actions"
local clipboard_actions = require "lir.clipboard.actions"

lir.setup {
  show_hidden_files = false,
  devicons = {
    enable = true,
  },
  mappings = {
    ["l"] = actions.edit,
    ["M"] = actions.split,
    ["N"] = actions.vsplit,
    ["<C-t>"] = actions.tabedit,
    ["h"] = actions.up,
    ["q"] = actions.quit,
    ["A"] = actions.mkdir,
    ["a"] = actions.newfile,
    ["r"] = actions.rename,
    ["@"] = actions.cd,
    ["Y"] = actions.yank_path,
    ["i"] = actions.toggle_show_hidden,
    ["d"] = actions.delete,
    ["J"] = function()
      mark_actions.toggle_mark()
      vim.cmd "normal! j"
    end,
    ["c"] = clipboard_actions.copy,
    ["x"] = clipboard_actions.cut,
    ["p"] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = true,
    },

    win_opts = function()
      local width = math.floor(vim.o.columns * 0.7)
      local height = math.floor(vim.o.lines * 0.7)
      return {
        border = "rounded",
        width = width,
        height = height,
      }
    end,
  },
  hide_cursor = false,
  on_init = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )
  end,
}

require("nvim-web-devicons").set_icon {
  lir_folder_icon = {
    icon = "",
    color = "#e5e9f0",
    name = "LirFolderNode",
  },
}
