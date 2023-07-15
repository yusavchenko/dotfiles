
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })


vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })


vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code Action"})
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code Action"})

vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", {desc = "Mason"})
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", {desc = "Lazy"})


vim.keymap.set("n", "<leader>e", "<cmd>Neotree left filesystem reveal toggle<cr>", {desc = "NeoTree"})
 -- { "<leader>cf", format, desc = "Format Document", has = "formatting" },
 --      { "<leader>cf", format, desc = "Format Range", mode = "v", has = "rangeFormatting" },
 --      { "<leader>ca", vim.lsp.buf.code_action,  mode = { "n", "v" }, has = "codeAction" }
 --
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })


vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("v", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
