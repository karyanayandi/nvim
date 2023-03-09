return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local setup = {
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      key_labels = {},
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },
      window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      ignore_missing = true,
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
      show_help = false,
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
    }

    local opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = true,
    }

    local mappings = {
      ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
      ["b"] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy{previewer = false, initial_mode='normal'})<cr>",
        "Buffer",
      },
      ["c"] = { "<cmd>:Bdelete<cr>", "Close" },
      ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      ["w"] = { "<cmd>w<CR>", "Write" },
      ["h"] = { "<cmd>nohlsearch<CR>", "No HL" },
      ["q"] = { '<cmd>lua require("config.functions").smart_quit()<CR>', "Quit" },
      ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
      ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
      ["gy"] = "Link",
      p = {
        name = "Lazy",
        I = { "<cmd>Lazy<cr>", "Install" },
        L = { "<cmd>Lazy log<cr>", "Log" },
        S = { "<cmd>Lazy sync<cr>", "Sync" },
        C = { "<cmd>Lazy check<cr>", "check" },
        X = { "<cmd>Lazy clean<cr>", "Clean" },
        U = { "<cmd>Lazy update<cr>", "Update" },
        D = { "<cmd>Lazy debug<cr>", "Debug" },
        P = { "<cmd>Lazy profile<cr>", "Profile" },
        R = { "<cmd>Lazy restore<cr>", "Restore" },
      },
      o = {
        name = "Options",
        w = { '<cmd>lua require("config.functions").toggle_option("wrap")<cr>', "Wrap" },
        r = { '<cmd>lua require("config.functions").toggle_option("relativenumber")<cr>', "Relative" },
        l = { '<cmd>lua require("config.functions").toggle_option("cursorline")<cr>', "Cursorline" },
        s = { '<cmd>lua require("config.functions").toggle_option("spell")<cr>', "Spell" },
        t = { '<cmd>lua require("config.functions").toggle_tabline()<cr>', "Tabline" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      },
      r = {
        name = "Replace",
        r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
        f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
      },
      d = {
        name = "Debug",
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
        O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
        l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
        u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
        x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
      },
      f = {
        name = "Find",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        f = {
          "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy{previewer = false})<cr>",
          "Find files",
        },
        t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
        T = { "<cmd>TodoTelescope theme=ivy<cr>", "Find Todo" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
        l = { "<cmd>Telescope resume<cr>", "Last Search" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
      },
      g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>GitBlameToggle<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
          "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
          "<cmd>Gitsigns diffthis HEAD<cr>",
          "Diff",
        },
      },
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        c = { "<cmd>lua require('lsp').server_capabilities()<cr>", "Get Capabilities" },
        d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
        F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        h = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
        H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
        I = { "<cmd>LspInstall<cr>", "Installer Info" },
        j = {
          "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
          "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        o = { "<cmd>SymbolsOutline<cr>", "Outline" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
        t = { '<cmd>lua require("config.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
        T = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", "Todo Diagnostics" },
        u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
      },
      t = {
        name = "Terminal",
        ["1"] = { ":1ToggleTerm<cr>", "1" },
        ["2"] = { ":2ToggleTerm<cr>", "2" },
        ["3"] = { ":3ToggleTerm<cr>", "3" },
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        l = { "<cmd>lua _LF_TOGGLE()<cr>", "lf" },
        b = { "<cmd>lua _BOTTOM_TOGGLE()<cr>", "btm" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
      },
      T = {
        name = "Treesitter",
        h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
        p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
        r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
      },
    }

    local vopts = {
      mode = "v",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = true,
    }

    local vmappings = {
      ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
    }

    require("which-key").setup(setup)
    require("which-key").register(mappings, opts)
    require("which-key").register(vmappings, vopts)
  end,
}
