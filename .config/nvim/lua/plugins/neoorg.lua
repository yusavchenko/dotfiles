return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          -- ["core.ui.calendar"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.keybinds"] ={},
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              icons = {
                todo={
                  pending = {
                    icon = "○"
                  },
                  urgent = {
                    icon = "⚡"
                  },
                  done = {
                    icon = "✔"
                  },
                }
              }
              }
          }, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes"
            },
          },
        },
      }
    end,
}
