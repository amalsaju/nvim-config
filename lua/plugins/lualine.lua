-- The below config is fully done by ChatGPT :)
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Kanagawa Dragon-inspired Lualine theme
		local kanagawa_dragon_lualine = {
			normal = {
				a = { fg = "#181616", bg = "#7dcfff", gui = "bold" },
				b = { fg = "#c8c093", bg = "#282727" },
				c = { fg = "#c8c093", bg = "#211E1E" },
			},
			insert = {
				a = { fg = "#181616", bg = "#98bb6c", gui = "bold" },
				b = { fg = "#c8c093", bg = "#282727" },
				c = { fg = "#c8c093", bg = "#211E1E" },
			},
			visual = {
				a = { fg = "#181616", bg = "#ff9e64", gui = "bold" },
				b = { fg = "#c8c093", bg = "#282727" },
				c = { fg = "#c8c093", bg = "#211E1E" },
			},
			replace = {
				a = { fg = "#181616", bg = "#ff5c57", gui = "bold" },
				b = { fg = "#c8c093", bg = "#282727" },
				c = { fg = "#c8c093", bg = "#211E1E" },
			},
			command = {
				a = { fg = "#181616", bg = "#b4f9f8", gui = "bold" },
				b = { fg = "#c8c093", bg = "#282727" },
				c = { fg = "#c8c093", bg = "#211E1E" },
			},
			inactive = {
				a = { fg = "#c8c093", bg = "#211E1E" },
				b = { fg = "#c8c093", bg = "#181616" },
				c = { fg = "#c8c093", bg = "#181616" },
			},
		}

		-- Helper: get Neo-tree current file color
		local function current_file_color()
			local ok, hl = pcall(vim.api.nvim_get_hl_by_name, "NeoTreeFileNameOpened", true)
			if ok and hl.foreground then
				return { fg = string.format("#%06x", hl.foreground), gui = "bold" }
			else
				return { fg = "#7dcfff", gui = "bold" }
			end
		end

		-- Helper: color based on current mode
		local function mode_color()
			local mode = vim.fn.mode()
			if mode == "i" then
				return kanagawa_dragon_lualine.insert.a.bg
			elseif mode == "v" or mode == "V" or mode == "" then
				return kanagawa_dragon_lualine.visual.a.bg
			elseif mode == "R" then
				return kanagawa_dragon_lualine.replace.a.bg
			elseif mode == "c" then
				return kanagawa_dragon_lualine.command.a.bg
			else
				return kanagawa_dragon_lualine.normal.a.bg
			end
		end

		-- Helper: dynamic color table for git and diagnostics
		local function dynamic_color()
			return { fg = mode_color(), gui = "bold" }
		end

		-- Setup Lualine
		require("lualine").setup({
			options = {
				theme = kanagawa_dragon_lualine,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				icons_enabled = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "", color = dynamic_color },
					{ "diff", symbols = { added = " ", modified = " ", removed = "" }, color = dynamic_color },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						color = dynamic_color,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = { modified = "  ", readonly = "  ", unnamed = "" },
						color = current_file_color,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "neo-tree" },
		})

		-- Highlight current file in Neo-tree permanently
		vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#7dcfff", bold = true })

		-- Cursor color consistent with Kanagawa Dragon
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "Cursor", { fg = "NONE", bg = "#7dcfff" })
			end,
		})
		vim.api.nvim_set_hl(0, "Cursor", { fg = "NONE", bg = "#7dcfff" })
	end,
}
