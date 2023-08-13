require("telescope").load_extension("notify")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
	},
})
