return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      lazy = true,
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
      "nvim-treesitter/playground",
    },
    {
      "windwp/nvim-ts-autotag",
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "c",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      sync_install = false,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      ignore_install = { "" },
      matchup = {
        enable = true,
        disable_virtual_text = true,
        disable = { "html", "smali", "jsonc" },
      },
      highlight = {
        enable = true,
        disable = { "markdown" },
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python" } },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        throttle = true,
        max_lines = 0,
        patterns = {},
      },
      autotag = {
        enable = true,
        disable = { "xml", "markdown" },
      },
      playground = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["at"] = "@class.outer",
            ["it"] = "@class.inner",
            ["ac"] = "@call.outer",
            ["ic"] = "@call.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@scopename.inner",
            ["aA"] = "@attribute.outer",
            ["iA"] = "@attribute.inner",
            ["aF"] = "@frame.outer",
            ["iF"] = "@frame.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        keys = {
          { "<c-space>", desc = "Increment selection" },
          { "<bs>", desc = "Schrink selection", mode = "x" },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>."] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>,"] = "@parameter.inner",
          },
        },
      },
    }
  end,
}
