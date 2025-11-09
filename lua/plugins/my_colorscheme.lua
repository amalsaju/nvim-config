return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		keywordStyle = { italic = false },
		statementStyle = { bold = false },
		colors = { -- add/modify theme and palette colors
			palette = {},
			theme = {
				wave = {},
				lotus = {},
				dragon = {},
				all = {
					ui = {
						fg = "#c5c9c5",
						fg_dim = "#C8C093",
						fg_reverse = "#223249",
						bg_dim = "#12120f",
						bg_gutter = "#181616",

						bg_m3 = "#0d0c0c",
						bg_m2 = "#12120f",
						bg_m1 = "#1D1C19",
						bg = "#181616",
						bg_p1 = "#282727",
						bg_p2 = "#393836",

						special = "#7a8382",
						whitespace = "#625e5a",
						nontext = "#625e5a",

						bg_visual = "#223249",
						bg_search = "#2D4F67",

						pmenu = {
							fg = "#DCD7BA",
							fg_sel = "none",
							bg = "#223249",
							bg_sel = "#2D4F67",
							bg_thumb = "#2D4F67",
							bg_sbar = "#223249",
						},

						float = {
							fg = "#C8C093",
							bg = "#0d0c0c",
							fg_border = "#54546D",
							bg_border = "#0d0c0c",
						},
					},
				},
			},
		},
		theme = "wave",
		background = {
			dark = "wave",
		},
	},
}
