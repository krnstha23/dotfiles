return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			notify_on_error = false,
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
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return false
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 3000,
				}
			end,
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
				async = true,
				timeout_ms = 3000,
			})
		end, { desc = "[F]ormat buffer or range (visual)" })
	end,
}
