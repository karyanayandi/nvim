local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup {
  -- UI
  {
    "karyanayandi/onenord.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require "user.colorscheme"
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require "user.colorizer"
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require "user.tailwind-colorizer"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "user.indentline"
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require "user.nvim-web-devicons"
    end,
  },
  {
    "echasnovski/mini.animate",
    config = function()
      require "user.animate"
    end,
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   config = function()
  --     require "user.bufferline"
  --   end,
  -- },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "user.lualine"
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    config = function()
      require "user.dressing"
    end,
  },

  -- EDITING SUPPORT
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "user.whichkey"
    end,
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-lua/popup.nvim", lazy = true },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "user.autopairs"
    end,
  },
  {
    "andymass/vim-matchup",
    config = function()
      require "user.matchup"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require "user.neoscroll"
    end,
  },
  {
    "nacro90/numb.nvim",
    config = function()
      require "user.numb"
    end,
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require "user.navic"
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require "user.fidget"
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter" },
    config = function()
      require "user.illuminate"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      require "user.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    config = function()
      require "user.dapui"
    end,
  },
  {
    "ravenxrz/DAPInstall.nvim",
    lazy = true,
    config = function()
      require("dap_install").setup {}
      require("dap_install").config("python", {})
    end,
  },
  {
    "ghillb/cybu.nvim",
    lazy = true,
    config = function()
      require "user.cybu"
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require "user.noice"
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require "user.notify"
    end,
  },
  {
    "monaqa/dial.nvim",
    config = function()
      require "user.dial"
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require "user.zenmode"
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require "user.comment"
    end,
  },
  { "folke/todo-comments.nvim" },

  -- TREESITTER
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        config = function()
          require "user.ts-context"
        end,
      },
      {
        "nvim-treesitter/playground",
      },
      {
        "windwp/nvim-ts-autotag",
      },
    },
    config = function()
      require "user.treesitter"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- COMPLETIONS
  {
    "hrsh7th/nvim-cmp",
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
      },
      {
        "hrsh7th/cmp-buffer",
      },
      {
        "hrsh7th/cmp-path",
      },
      {
        "hrsh7th/cmp-cmdline",
      },
      {
        "saadparwaiz1/cmp_luasnip",
      },
      {
        "hrsh7th/cmp-nvim-lua",
      },
      { "hrsh7th/cmp-emoji" },
      { "zbirenbaum/copilot-cmp", dependencies = "copilot.lua" },
    },
    config = function()
      require "user.cmp"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  },

  -- SNIPPETS
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "karyanayandi/friendly-snippets",
    },
  },

  -- LANGUAGE SERVER PROTOCOL
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "jose-elias-alvarez/typescript.nvim" },
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    },
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    config = function()
      require "user.lsp.mason"
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = function()
      require "user.lsp.null-ls"
    end,
  },
  { "b0o/SchemaStore.nvim" },
  { "prisma/vim-prisma" },
  { "simrat39/symbols-outline.nvim" },
  { "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = "markdown" },

  {
    "ellisonleao/dotenv.nvim",
    config = function()
      require "user.dotenv"
    end,
  },

  -- GIT
  {
    "f-person/git-blame.nvim",
    config = function()
      require "user.git-blame"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "user.gitsigns"
    end,
  },

  {
    "ruifm/gitlinker.nvim",
    config = function()
      require "user.gitlinker"
    end,
  },
  {
    "mattn/vim-gist",
    config = function()
      require "user.gist"
    end,
  },
  {
    "mattn/webapi-vim",
  },

  -- MOTION
  {
    "phaazon/hop.nvim",
    config = function()
      require "user.hop"
    end,
  },

  --  TELESCOPE
  {
    "nvim-telescope/telescope.nvim",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require "user.project"
        end,
      },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "tom-anders/telescope-vim-bookmarks.nvim" },
    },
    config = function()
      require "user.telescope"
    end,
  },

  -- UTILS
  { "folke/trouble.nvim" },
  {
    "abecodes/tabout.nvim",
    lazy = true,
    dependencies = { "nvim-treesitter" },
    config = function()
      require "user.tabout"
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "user.nvim-tree"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require "user.toggleterm"
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require "user.alpha"
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require "user.surround"
    end,
  },
  {
    "tversteeg/registers.nvim",
    config = function()
      require "user.registers"
    end,
  },
  {
    "filipdutescu/renamer.nvim",
    config = function()
      require "user.renamer"
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require "user.spectre"
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    init = function()
      vim.keymap.set({ "n", "x" }, "<leader>cR", function()
        require("ssr").open()
      end, { desc = "Structural Replace" })
    end,
  },
  {
    "moll/vim-bbye",
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    "wakatime/vim-wakatime",
  },
}
