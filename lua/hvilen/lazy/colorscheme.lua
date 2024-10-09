return { "catppuccin/nvim", name = "catppuccin", lazy = false,
	config = function()
		require("catppuccin").setup({
    			flavour = "macchiato", -- latte, frappe, macchiato, mocha
    			background = { -- :h background
        			light = "latte",
        			dark = "mocha",
    			},
    			transparent_background = true
			})

			-- setup must be called before loading
		vim.cmd.colorscheme "catppuccin"
	end
}

-- return { "rose-pine/neovim", name = "rose-pine", 
-- 	config = function()
-- 		require("rose-pine").setup({    variant = "moon", -- auto, main, moon, or dawn
--     			dark_variant = "main", -- main, moon, or dawn
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }
