local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions


null_ls.setup {
  debug = false,
  sources = {
    formatting.stylua,
    formatting.google_java_format,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.prettier.with({
      prefer_local = "node_modules/.bin",
      extra_filetypes = { "toml" },
    }),
    diagnostics.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    diagnostics.flake8,
    code_actions.eslint_d
  },
}
