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
	--this plugin is now deprecated in favour of vim.lsp.config
	--its functionality now is to provide server specific configs in the lsp folder
	{
		"neovim/nvim-lspconfig",
		keys = {
			{ "K", vim.lsp.buf.hover, desc = "Show hover information" },
			{ "gd", vim.lsp.buf.definition, desc = "Jump to definition of symbol under cursor" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Show available code actions" },
		},
	},
}
