local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins
return packer.startup(function(use)
  -- Plugin Manager
  use "wbthomason/packer.nvim"

  -- Language Server Protocol
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "simrat39/symbols-outline.nvim"
  use "ray-x/lsp_signature.nvim"
  use "b0o/SchemaStore.nvim"
  use "SmiteshP/nvim-navic"
  use "RRethy/vim-illuminate"
  use "j-hui/fidget.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "jose-elias-alvarez/typescript.nvim"
  -- use {"github/copilot.vim"}
  use {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require "user.copilot"
      end, 100)
    end,
  }

  -- Session
  use "rmagatti/auto-session"
  use "rmagatti/session-lens"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }
  use "zbirenbaum/copilot-cmp"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "karyanayandi/friendly-snippets"

  -- UI
  use { "karyanayandi/onenord.nvim", branch = "custom" }
  use "stevearc/dressing.nvim"
  use "NvChad/nvim-colorizer.lua"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "rcarriga/nvim-notify"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"

  -- Editing Support
  use "windwp/nvim-autopairs"
  use "monaqa/dial.nvim"
  use "nacro90/numb.nvim"
  use "andymass/vim-matchup"
  use "folke/zen-mode.nvim"
  use "karb94/neoscroll.nvim"
  use "junegunn/vim-slash"

  -- Motion
  use "phaazon/hop.nvim"

  -- Keymapping
  use "folke/which-key.nvim"

  -- Utilities
  use "folke/trouble.nvim"
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "tamago324/lir.nvim"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "goolord/alpha-nvim"
  use "kylechui/nvim-surround"
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" },
  }
  use "nvim-pack/nvim-spectre"
  use "filipdutescu/renamer.nvim"
  use "kevinhwang91/nvim-bqf"
  use "Mephistophiles/surround.nvim"
  use "tversteeg/registers.nvim"
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  }
  use "ghillb/cybu.nvim"
  -- use { "yardnsm/vim-import-cost", run = "npm install --production" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
