return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				csharp = { "csharpier" },
				razor = { "csharpier" },
				cshtml = { "csharpier" },
				yaml = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})

		-- Configure individual formatters
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}

		conform.formatters.shfmt = {
			prepend_args = { "-i", "4" },
		}

		conform.formatters.csharpier = {
			command = "dotnet",
			args = { "csharpier", "--write-stdout", "-" },
			stdin = true,
		}

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			})
		end, { desc = " prettier Format whole file or range (in visual mode) with" })
	end,
}
