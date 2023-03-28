return {
  "kyazdani42/nvim-tree.lua",
  config = function()
    local icons = require "config.icons"
    local nvim_tree_config = require "nvim-tree.config"
    local tree_cb = nvim_tree_config.nvim_tree_callback

    require("nvim-tree").setup {
      hijack_directories = {
        enable = false,
      },
      filters = {
        custom = { ".git" },
        exclude = { ".gitignore", ".env" },
      },
      update_cwd = true,
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = icons.ui.ArrowOpen,
              arrow_closed = icons.ui.ArrowClosed,
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = icons.git.Merged,
              renamed = icons.git.Rename,
              untracked = icons.git.Untracked,
              deleted = icons.git.Remove,
              ignored = icons.git.Ignore,
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      view = {
        width = 30,
        -- height = 30,
        hide_root_folder = false,
        side = "left",
        mappings = {
          custom_only = false,
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
            { key = "h",                  cb = tree_cb "close_node" },
            { key = "v",                  cb = tree_cb "vsplit" },
          },
        },
        number = false,
        relativenumber = false,
      },
    }
  end,
}
