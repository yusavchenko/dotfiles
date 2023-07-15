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
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
    }
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
  "jonahgoldwastaken/copilot-status.nvim",
  dependencies = {  "zbirenbaum/copilot.lua"
 },
  event = "BufReadPost",
}

  -- copilot
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   opts = {
  --     panel = {
  --       enabled = true,
  --       auto_refresh = false,
  --       keymap = {
  --         accept = "<CR>",
  --       }
  --     },
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --       keymap = {
  --         accept = "<Tab>",
  --         prev = "<M-[>",
  --         next = "<M-]>",
  --         dismiss = "<C-]>",
  --       },
  --     }
  --   },
  -- },
}
