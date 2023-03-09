return {
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      schemas = require("b0o/SchemaStore.nvim").json.schemas(),
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
  setup = {},
}
