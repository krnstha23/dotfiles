return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			background = {
				dark = "macchiato",
			},
			transparent_background = true,
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin")
	end,
}
