return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
      "MunifTanjim/nui.nvim",
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
  optional = false,
  opts = {
     use_libuv_file_watcher = true,
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
buffers = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --              -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          group_empty_dirs = true, -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
            }
          },
        },
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
