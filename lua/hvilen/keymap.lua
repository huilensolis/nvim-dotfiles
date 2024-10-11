local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end


vim.g.mapleader = " "
map("n", "<leader>pv", vim.cmd.Ex)

-- nvim tree
map("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Shift + Up/Down to move line up/down
map('n', '<M-j>', 'yyddp')
map('n', '<M-k>', 'yyddkP')

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- vertical split
map('n', '<C-s>', vim.cmd.vs)

-- resize split windows
-- map('n', '<S>c', function()
--     vim.cmd("vertical resize +5")
-- end)
-- map('n', '<S>s', function()
--     vim.cmd("vertical resize -5")
-- end)
