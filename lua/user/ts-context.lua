local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
	return
end

context.setup{
    enable = false,
    throttle = true,
    max_lines = 0,
    patterns = {
    },
}
