return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {--[[ things you want to change go here]]
		size = 22,
		open_mapping = [[;t]],
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = "1",
		start_in_insert = true,
		persist_size = true,
		direction = "float",

		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts),
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts),
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts),
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts),
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts),
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opt, s),
	},
}
