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
vim.g.textwidth = 130
vim.opt.termguicolors = true
vim.env.TERM = "xterm-256color"

-- Terminal Stuff here
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("customer-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.keymap.set("n", "<leader>st", function()
  vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
end)

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
		-- Set the sign text table
		text = diagnostic_icons,
		-- You can also optionally set numhl or linehl
		-- numhl = {
		--   [vim.diagnostic.severity.WARN] = "DiagnosticLineWarnNumber"
		-- },
	},
	virtual_text = true,
	underline = true,
	severity_sort = true,
})
-- Default options:

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})

vim.cmd.colorscheme("kanagawa")
