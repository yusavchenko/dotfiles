local builtin = require('telescope.builtin')


vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader><fr', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc ="Find Grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find Buffer"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find Help"})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {desc = "Find Symbols"})


vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "Find Recent"})

