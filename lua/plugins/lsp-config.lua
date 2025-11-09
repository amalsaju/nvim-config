return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "zls", "ts_ls" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		keys = {
			{ "K", vim.lsp.buf.hover, desc = "Show hover information" },
			{ "gd", vim.lsp.buf.definition, desc = "Jump to definition of symbol under cursor" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Show available code actions" },
		},
	},
}
