return {
  "nvim-telescope/telescope.nvim",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          active = true,
          on_config_done = nil,
          manual_mode = false,
          detection_methods = { "pattern" },
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
          show_hidden = false,
          silent_chdir = true,
          ignore_lsp = {},
          exclude_dirs = { "dist", "build", ".next", "node_modules" },
          datapath = vim.fn.stdpath "data",
        }

        require("telescope").load_extension "projects"
      end,
    },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "tom-anders/telescope-vim-bookmarks.nvim" },
  },
  config = function()
    local actions = require "telescope.actions"
    local file_browser_actions = require("telescope").extensions.file_browser.actions
    local icons = require "config.icons"

    local function telescope_buffer_dir()
      return vim.fn.expand "%:p:h"
    end

    require("telescope").setup {
      defaults = {
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = {
          ".git/",
          "target/",
          "docs/",
          "vendor/*",
          ".storybook/*",
          "%.lock",
          "__pycache__/*",
          "%.sqlite3",
          "%.ipynb",
          "node_modules/*",
          ".dart_tool/",
          ".gradle/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/",
          "build/",
          "gradle/",
          "node_modules/",
          "%.pdb",
          "%.dll",
          "%.class",
          "%.exe",
          "%.cache",
          "%.ico",
          "%.pdf",
          "%.dylib",
          "%.jar",
          "%.docx",
          "%.met",
          "smalljre_*/*",
          ".vale/",
          "%.burp",
          "%.mp4",
          "%.mkv",
          "%.rar",
          "%.zip",
          "%.7z",
          "%.tar",
          "%.bz2",
          "%.epub",
          "%.flac",
          "%.tar.gz",
          ".config",
          "%.env",
          ".local",
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-s>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<c-d>"] = require("telescope.actions").delete_buffer,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key,
          },
          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,
            ["q"] = actions.close,
            ["dd"] = require("telescope.actions").delete_buffer,
            ["s"] = actions.select_horizontal,
            ["v"] = actions.select_vertical,
            ["t"] = actions.select_tab,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {},
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-w>"] = function()
                vim.cmd "normal vbd"
              end,
            },
            ["n"] = {
              ["a"] = file_browser_actions.create,
              ["c"] = file_browser_actions.copy,
              ["x"] = file_browser_actions.move,
              ["d"] = file_browser_actions.remove,
              ["r"] = file_browser_actions.rename,
              ["H"] = file_browser_actions.toggle_hidden,
              ["h"] = file_browser_actions.goto_parent_dir,
              ["w"] = file_browser_actions.goto_cwd,
              ["/"] = function()
                vim.cmd "startinsert"
              end,
            },
          },
        },
        media_files = {
          filetypes = { "png", "webp", "jpg", "jpeg" },
          find_cmd = "rg",
        },
      },
    }

    vim.keymap.set("n", ";e", function()
      require("telescope").extensions.file_browser.file_browser {
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
      }
    end)

    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "media_files"
  end,
}
