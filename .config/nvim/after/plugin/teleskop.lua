local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

telescope.setup({
  defaults = {
    path_display={"smart"} 
  },
  pickers = {
    colorscheme = {
          enable_preview = true
        }
      }
})
telescope.load_extension("live_grep_args")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fR', builtin.resume, {desc = "Resume search"})
vim.keymap.set('n', '<leader>ft', builtin.colorscheme, {desc = "Colorscheme"})
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {desc = "Find Files"})
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {desc = "Find Grep"})
vim.keymap.set("n", "<leader>fc", live_grep_args_shortcuts.grep_word_under_cursor, {desc = "Greps the word under the cursor"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find Buffer"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find Help"})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {desc = "Find Symbols"})


vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "Find Recent"})
vim.keymap.set('n', '<leader>dt', trouble.open_with_trouble, {desc = "Open troubles"})
vim.keymap.set('v', '<leader>dt', trouble.open_with_trouble, {desc = "Open troubles"})

