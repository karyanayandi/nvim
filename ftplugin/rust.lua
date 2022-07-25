local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  R = {
    name = "Rust",
    h = { "<cmd>RustToggleInlayHints<Cr>", "Toggle Hints" },
    r = { "<cmd>lua _CARGO_RUN()<cr>", "Cargo Run" },
    t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
    m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
    c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
    p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
    d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
    v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
    R = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
      "Reload Workspace",
    },
  },
}

which_key.register(mappings, opts)

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "message with no corresponding" then
    return
  end

  notify_filter(msg, ...)
end


local Terminal = require("toggleterm.terminal").Terminal
local vertical_term = Terminal:new {
  cmd = "cargo run",
  direction = "vertical",
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "n",
      "<C-4>",
      "<cmd>4ToggleTerm size=60 direction=vertical<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "t",
      "<C-4>",
      "<cmd>4ToggleTerm size=60 direction=vertical<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "i",
      "<C-4>",
      "<cmd>4ToggleTerm size=60 direction=vertical<cr>",
      { noremap = true, silent = true }
    )
  end,
  count = 4,
}

function _CARGO_TERM()
  vertical_term:toggle(60)
end

vim.api.nvim_set_keymap("n", "<C-4>", "<cmd>lua _CARGO_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-4>", "<cmd>lua _CARGO_TERM()<CR>", { noremap = true, silent = true })
