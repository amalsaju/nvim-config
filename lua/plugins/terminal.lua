vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local state = {
	terminal = {
		buf = -1,
		win = -1,
		visible = false,
	},
}

local win_config = {
	split = "below",
	width = vim.o.columns,
	height = 10,
}

local function create_small_terminal(opts)
	opts = opts or {}

	local buf = vim.api.nvim_create_buf(false, true)

	local win = vim.api.nvim_open_win(buf, true, win_config)
	return { win = win, buf = buf }
end

vim.keymap.set({ "n", "t" }, "<leader>tt", function()
	print(state.terminal.buf, state.terminal.win)
	if state.terminal.buf == -1 or state.terminal.win == -1 then
		return
	end
	if not vim.api.nvim_buf_is_valid(state.terminal.buf) then
		print("Buffer not valid")
		return
	end
	if not state.terminal.visible then
		state.terminal.win = vim.api.nvim_open_win(state.terminal.buf, true, win_config)
		state.terminal.visible = true
	else
		vim.api.nvim_win_hide(state.terminal.win)
		state.terminal.visible = false
	end
end)

vim.keymap.set({ "n" }, "<leader>st", function()
	state.terminal = create_small_terminal()
	if vim.bo[state.terminal.buf].buftype ~= "terminal" then
		vim.cmd.terminal()
		state.terminal.visible = true
	end
end)

return {}
