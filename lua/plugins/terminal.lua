
-- keymaps

-- Function to open a centered floating window
local function open_floating_window()
    local buf = vim.api.nvim_create_buf(false, true) -- create a scratch buffer

    -- Get screen dimensions
    local width = math.floor(vim.o.columns * 0.6)
    local height = math.floor(vim.o.lines * 0.6)

    -- Calculate center position
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Window options
    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, opts)
    return buf, win
end

-- Example usage: call the function to open the window
-- open_floating_window()

