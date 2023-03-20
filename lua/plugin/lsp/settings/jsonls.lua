local schemastore = require("schemastore")

return {
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
  setup = {},
}
