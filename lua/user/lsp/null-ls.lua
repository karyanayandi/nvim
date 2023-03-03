local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  debug = true,
  sources = {
    formatting.stylua,
    formatting.google_java_format,
    formatting.black.with {
      extra_args = { "--fast" },
    },
    formatting.fish_indent,
    formatting.goimports,
    formatting.prettierd.with {
      prefer_local = "node_modules/.bin",
      extra_filetypes = { "php", "toml", "svelte", "env", "example" },
    },
    formatting.prismaFmt,
    formatting.deno_fmt.with {
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      condition = function(utils)
        return utils.root_has_file { "deno.json" }
      end,
    },
    formatting.gofmt,
    formatting.goimports,
    formatting.golines,
    formatting.phpcsfixer,
    formatting.shfmt,
    diagnostics.actionlint,
    diagnostics.fish,
    diagnostics.eslint_d.with {
      prefer_local = "node_modules/.bin",
      extra_filetypes = { "svelte" },
      condition = function(utils)
        return utils.root_has_file { "package.json" }
      end,
    },
    diagnostics.flake8,
    diagnostics.golangci_lint,
    diagnostics.phpcs,
    diagnostics.shellcheck,
    code_actions.eslint_d,
    code_actions.gitsigns,
    require "typescript.extensions.null-ls.code-actions",
  },
}
