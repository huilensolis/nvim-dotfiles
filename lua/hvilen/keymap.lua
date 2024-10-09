vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- nvim tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- auto format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.cmd.LspZeroFormat]]
