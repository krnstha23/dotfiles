return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		toggle = { enabled = true },
	},
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
			"<leader>t",
			function()
				require("snacks").explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>sh",
			function()
				require("snacks").picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>bb",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sd",
			function()
				require("snacks").picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				require("snacks").picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sf",
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

		-- lsp
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
}
