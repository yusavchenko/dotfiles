return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
      "MunifTanjim/nui.nvim",
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
  optional = false,
  opts = {
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },

    default_component_configs = {
        modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
        },
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
        },
        git_status = {
          symbols = {
            renamed = "󰁕",
            unstaged = "󰄱",
          },
        },
    }
  }
}
