return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		labels = "asdfghjklqwertyuiopzxcvbnm",
		search = { mode = "fuzzy" },
		label = {
			uppercase = false,
			rainbow = {
				enabled = true,
				shade = 5,
			},
		},
		highlight = {
			backdrop = true,
			matches = true,
		},
		pattern = "",
		jump = {
			autojump = true,
		},
		continue = false,
		prompt = {
			enabled = true,
		},
		remote_op = {
			restore = true,
		},
		modes = {
			char = {
				jump_labels = true,
				multi_line = false,
			},
		},
	},
	keys = {
		{
			"m",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"M",
			mode = { "n" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"mr",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"MR",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
	},
}
