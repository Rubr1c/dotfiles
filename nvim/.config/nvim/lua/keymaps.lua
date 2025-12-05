local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>t", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })
map("n", "<leader>b", ":wincmd p<CR>", { desc = "Back to file buf" })

map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Terminal to normal mode" })


