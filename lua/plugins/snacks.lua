return {
	-- HACK: docs @ https://github.com/folke/snacks.nvim/blob/main/docs
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = true,
		-- NOTE: Options
		opts = {
			-- Styling for each Item of Snacks
			styles = {
				input = {
					keys = {
						n_esc = { "<C-c>", { "cmp_close", "cancel" }, mode = "n", expr = true },
						i_esc = { "<C-c>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
					},
				},
			},
			-- Snacks Modules
			input = { enabled = true },
			scroll = { enabled = true },
			indent = { enabled = true },
			quickfile = {
				enabled = true,
				exclude = { "latex" },
			},
			-- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
			picker = {
				enabled = false,
			},
			dashboard = {
				enabled = false,
			},
		},
		-- NOTE: Keymaps
		keys = {
			-- git stuff
			{
				";c",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<leader>gb",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Pick and Switch Git Branches",
			},
			{
				"<leader>rN",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast Rename Current File",
			},

			-- Snacks Picker
			{
				"<leader><leader>",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files (Snacks Picker)",
			},
			{
				"<leader>nc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>/",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep word",
			},
			{
				"<leader>w/",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Search Visual selection or Word",
				mode = { "n", "x" },
			},
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "telescope" })
				end,
				desc = "Search Keymaps (Snacks Picker)",
			},
			{
				"<leader>sh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>b",
				function()
					require("snacks").picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>ef",
				function()
					require("snacks").picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>sr",
				function()
					require("snacks").picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<leader>d",
				function()
					require("snacks").picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"<leader>D",
				function()
					require("snacks").picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"<leader>r",
				function()
					require("snacks").picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"<leader>i",
				function()
					require("snacks").picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"<leader>dd",
				function()
					require("snacks").picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				";s",
				function()
					require("snacks").picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				";p",
				function()
					require("snacks").picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
		},
	},
	-- NOTE: todo comments w/ snacks
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		optional = true,
		keys = {
			{
				"<leader>pt",
				function()
					require("snacks").picker.todo_comments()
				end,
				desc = "Todo",
			},
			{
				"<leader>pT",
				function()
					require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
		},
	},
}
