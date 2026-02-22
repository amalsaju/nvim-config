-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = true, silent = true, desc = "Window commands" })

-- Wrapping stuff
vim.opt.textwidth = 80
vim.opt.wrap = true
vim.opt.linebreak = true -- wrap at word boundaries
vim.opt.breakindent = true -- keep indentation

vim.opt.termguicolors = true
vim.env.TERM = "xterm-256color"
vim.keymap.set({ "n", "x", "o" }, "0", "^", { noremap = true })
vim.keymap.set({ "n", "x", "o" }, "^", "0", { noremap = true })

-- Insert mode, toggle comment on current line
vim.keymap.set("n", "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

-- Visual mode: toggle comment for selected lines
vim.keymap.set("v", "<C-_>", function()
	-- Exit visual mode first, then apply toggle
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })
vim.opt.ignorecase = true -- search ignores case
vim.opt.smartcase = true -- but becomes case-sensitive if you type a capital
vim.keymap.set("n", "<leader>q", "<C-w>q", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lx", function()
	vim.cmd("write")
	vim.cmd("luafile " .. vim.fn.expand("%"))
end)

-- Set foldmethod=indent for programming languages
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"python",
		"typescriptreact",
		"javascriptreact",
		"lua",
		"javascript",
		"typescript",
		"cpp",
		"java",
		"go",
		"ruby",
		"rust",
		"html",
		"css",
		"php",
	},
	callback = function()
		vim.opt_local.foldmethod = "indent"
		vim.opt_local.foldenable = true -- Enable folding by default for these filetypes
	end,
})

-- For other filetypes (e.g., neo-tree, help, markdown), disable folding
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "neo-tree", "help", "TelescopePrompt", "markdown", "txt" },
	callback = function()
		vim.opt_local.foldmethod = "manual"
		vim.opt_local.foldenable = false
	end,
})

-- Terminal Stuff here

-- Diagnostic signs for the sign column
-- Define the icons you want for each diagnostic type
local diagnostic_icons = {
	[vim.diagnostic.severity.ERROR] = "",
	[vim.diagnostic.severity.WARN] = "",
	[vim.diagnostic.severity.INFO] = "",
	[vim.diagnostic.severity.HINT] = "",
}

vim.diagnostic.config({
	signs = {
		text = diagnostic_icons,
	},
	float = {
		wrap = true,
		max_width = 80,
	},
	virtual_text = false,
	underline = true,
	severity_sort = true,
})
vim.keymap.set("n", "<leader>dn", function()
  vim.diagnostic.open_float({ scope = "line" })
end)
-- Default options:

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})

vim.cmd.colorscheme("kanagawa")
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#010101" })
vim.api.nvim_set_hl(0, "IblScope", { fg = "#010101" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0d0c0c" })

