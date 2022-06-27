local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions


null_ls.setup {
  debug = false,
  sources = {
    -- formatting.prettier.with {
    --   extra_filetypes = { "toml" },
    --   extra_args = { "--no-semi", "--no-single-quote", "--no-jsx-single-quote", "--bracket-spacing", "--print-width 80",
    --     "--prose-wrap always", "--tab-width 2", "--trailing-comma all", "--end-of-line auto" },
    -- },
    formatting.stylua,
    formatting.google_java_format,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    diagnostics.eslint.with({
      prefer_local = "node_modules/.bin",
    }),
    code_actions.eslint_d
  },
}
