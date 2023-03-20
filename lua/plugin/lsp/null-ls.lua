local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  debug = true,
  debounce = 150,
  sources = {
    formatting.stylua,
    formatting.fish_indent,
    formatting.prettierd.with {
      prefer_local = "node_modules/.bin",
      extra_filetypes = { "php", "toml", "svelte", "env", "example" },
    },
    formatting.deno_fmt.with {
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      condition = function(utils)
        return utils.root_has_file { "deno.json" }
      end,
    },
    formatting.gofmt,
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
    diagnostics.shellcheck,
    code_actions.eslint_d,
    code_actions.gitsigns,
    require "typescript.extensions.null-ls.code-actions",
  },
}
