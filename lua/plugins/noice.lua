return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local noice = require("noice")

		noice.setup({
			cmdline = {
				enabled = false,
			},
			lsp = {
				progress = {
					enabled = true,
				},
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
				signature = {
					auto_open = { enabled = false }, -- disable auto signature help on insert mode
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
							{ find = "%d fewer lines" },
							{ find = "%d more lines" },
						},
					},
					opts = { skip = true },
				},
			},
			messages = {
				enabled = false,
			},
			health = {
				checker = true,
			},
			popupmenu = {
				enabled = true,
			},
			signature = {
				enabled = true,
			},
		})
	end,
}
