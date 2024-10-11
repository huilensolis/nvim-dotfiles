vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- nvim tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- format buffer
vim.keymap.set("n", "<leader>f", vim.cmd.LspZeroFormat)
