local function on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      require("copilot").setup({
        -- suggestion = { enabled = false },
        -- panel = { enabled = false },
      })
    end

  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {  "onsails/lspkind.nvim"},

    config = function()
      require("copilot_cmp").setup()
    end
  },
  { 'AndreM222/copilot-lualine' },
  {
    "jonahgoldwastaken/copilot-status.nvim",
    dependencies = {  "zbirenbaum/copilot.lua"},
    event = "BufReadPost",
  }
}
