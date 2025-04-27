-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indenting
vim.opt.smartindent = true

-- wrap
vim.opt.wrap = false
vim.diagnostic.config({
    virtual_text = {
        wrap = true,
        max_lines = 10,
        spacing = 4,
    },
})

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

--
vim.opt.termguicolors = true

-- bottom padding
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--update time
vim.opt.updatetime = 50

-- clipboard
vim.keymap.set('n', 'y', '"+y')
vim.keymap.set('n', 'yy', '"+yy')
vim.keymap.set('n', 'Y', '"+Y')
vim.keymap.set('x', 'y', '"+y')
vim.keymap.set('x', 'Y', '"+Y')
