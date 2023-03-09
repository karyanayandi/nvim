local schemastore = require "schemastore"

return {
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      schamas = schemastore.json.schemas(),
    },
  },
  setup = {},
}
