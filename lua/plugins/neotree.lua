return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle <cr>", desc = "NeoTree" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#ff5555", bold = true })
	end,
	lazy = false,
	opts = {
		enable_git_status = true,
		enable_diagnostics = true,
		window = {
			position = "right",
			width = 25,
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
		},
	},
}
