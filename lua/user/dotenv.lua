local status_ok, dotenv = pcall(require, "dotenv")
if not status_ok then
  return
end

dotenv.setup {
  enable_on_load = true,
  verbose = false,
}
