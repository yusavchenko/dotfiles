
local function getStatus ()      
        local icon = ""
        local status = require("copilot.api").status.data
        return icon .. (status.message or "")
    end

-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   opts = {
--      sections = {
--     lualine_x =  { getStatus, 
--   }
--     }
--   }
-- }

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
           component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
          -- stylua: ignore
          {
            function() return require("nvim-navic").get_location() end,
            cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
          },
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
          },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates },
          {
            "diff",
          },
        --   { function()
        --       local icon = ""
        --       local status = require("copilot.api").status.data
        --       return icon .. (status.message or "")
        --     end,
        --   cond = function() 
        --     local ok, clients = pcall(require, "copilot.api")
        --     print(ok, #clients)
        --     return ok and #clients > 0
        --   end
        -- }
        },
        lualine_y = {
          {
            'copilot',
            -- Default values
            symbols = {
                status = {
                    icons = {
                        enabled = "",
                        disabled = "",
                        warning = "",
                        unknown = ""
                    },
                    hl = {
                        enabled = "#50FA7B",
                        disabled = "#6272A4",
                        warning = "#FFB86C",
                        unknown = "#FF5555"
                    }
                },
                spinners = require("copilot-lualine.spinners").dots,
                spinner_color = "#6272A4"
            },
            show_colors = false,
            show_loading = true
        },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
