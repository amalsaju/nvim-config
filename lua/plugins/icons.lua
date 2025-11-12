return {
	-- File icons
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "" }, -- added
				change = { text = "" }, -- modified
				delete = { text = "" }, -- deleted
				topdelete = { text = "" },
				changedelete = { text = "" }, -- modified+deleted
			},
			numhl = false, -- disable highlighting line number
			current_line_blame = false,
		},
	},
}
