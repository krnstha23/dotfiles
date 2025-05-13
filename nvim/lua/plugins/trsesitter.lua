return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"vim",
			"vimdoc",
			"c_sharp",
			"css",
			"go",
			"tsx",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "cshtml" },
		},
		-- Add this folding configuration
		folding = {
			enable = true,
			disable = {}, -- List of languages to disable folding for
			fold_virt_text = true, -- Show folded virtual text
		},
	},
	config = function(_, opts)
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

		-- Prefer git instead of curl in order to improve connectivity in some environments
		require("nvim-treesitter.install").prefer_git = true
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)

		-- Set fold settings (these are vim options, not treesitter specific)
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = true
		vim.opt.foldlevelstart = 99 -- Start with all folds open
		vim.opt.foldnestmax = 10 -- Maximum nested folds
		vim.opt.foldminlines = 1 -- Minimum number of lines to allow folding

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "cshtml",
			callback = function()
				vim.opt_local.foldmethod = "expr"
				vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
				vim.opt_local.foldnestmax = 20 -- Razor files often need more nesting
			end,
		})
	end,
}
