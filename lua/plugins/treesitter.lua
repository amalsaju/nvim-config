return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		ensure_installed = { "lua", "javascript", "typescript", "zig", "c" },
		highlight = { ensure = true },
		indent = { ensure = true },
	},
}
