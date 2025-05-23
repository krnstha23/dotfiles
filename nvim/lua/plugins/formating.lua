return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return false
			end

			return {
				timeout_ms = 1000,
				lsp_fallback = true,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			csharp = { "csharpier" },
			javascript = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
		},
	},
}
