vim.keymap.set("n", "<M-a>", "gg<S-v>G")
vim.keymap.set("n", "<Leader><C-q>", ":quit<Return>", opts)
vim.keymap.set("n", "<Leader>Q", ":qa<Return>", opts)
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "O", "o<Esc>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Normal mode mappings to move current line up/down
vim.keymap.set("n", "H", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "L", ":m .-2<CR>==", { noremap = true, silent = true })

-- Insert mode mappings
vim.keymap.set("i", "<A-h>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-l>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Visual mode mappings
vim.keymap.set("v", "H", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "L", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "H", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "L", ":m '<-2<CR>gv=gv", opts)

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Tabs
vim.keymap.set("n", "<Leader><tab>", ":tabnew<Return>", opts)
vim.keymap.set("n", "<Leader><C-x>", ":tabonly<Return>", opts)
vim.keymap.set("n", "<leader>tr", ":tabedit")
vim.keymap.set("n", "<tab>", ":tabnext<Return>", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
vim.keymap.set("n", "<leader>tw", ":tabclose<Return>", opts)

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- Resize window
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")

-- fold
vim.keymap.set("n", "<leader>z", "za", { desc = "Toggle fold" })
vim.keymap.set("n", "<leader>zo", "zR", { desc = "[Z] Open all folds" })
vim.keymap.set("n", "<leader>zc", "zM", { desc = "[Z] Close all folds" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- comment keymaps
vim.keymap.set("n", "gcc", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment toggle current line" })
vim.keymap.set("n", "gbc", "<Plug>(comment_toggle_blockwise_current)", { desc = "Comment toggle current block" })

-- [[ Basic Autocommands ]]
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
