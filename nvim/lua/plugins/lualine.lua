-- ~/.config/nvim/lua/plugins/rosepinelualine.lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Палитра rose-pine (main), base заменён на #080814
    local colors = {
      bg      = "#080814",  -- base (было #191724)
      fg      = "#e0def4",  -- text
      dark_bg = "#080814",

      -- Акценты
      normal  = "#31748f",  -- pine
      insert  = "#95b1ac",  -- leaf (близко к "зелёному" для insert)
      visual  = "#c4a7e7",  -- iris
      replace = "#eb6f92",  -- love
      command = "#9ccfd8",  -- foam

      -- Дополнительные
      cyan    = "#9ccfd8",  -- foam
      white   = "#e0def4",  -- text
      gray    = "#6e6a86",  -- muted
      accent  = "#f6c177",  -- gold
      rose    = "#ebbcba",
    }

    require('lualine').setup({
      options = {
        theme = {
          normal = {
            a = { bg = colors.normal,  fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg,      fg = colors.normal },
            c = { bg = colors.bg,      fg = colors.fg },
          },
          insert = {
            a = { bg = colors.insert,  fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg,      fg = colors.insert },
            c = { bg = colors.bg,      fg = colors.fg },
          },
          visual = {
            a = { bg = colors.visual,  fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg,      fg = colors.visual },
            c = { bg = colors.bg,      fg = colors.fg },
          },
          replace = {
            a = { bg = colors.replace, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg,      fg = colors.replace },
            c = { bg = colors.bg,      fg = colors.fg },
          },
          command = {
            a = { bg = colors.command, fg = colors.bg, gui = "bold" },
            b = { bg = colors.bg,      fg = colors.command },
            c = { bg = colors.bg,      fg = colors.fg },
          },
          inactive = {
            a = { bg = colors.bg, fg = colors.gray },
            b = { bg = colors.bg, fg = colors.gray },
            c = { bg = colors.bg, fg = colors.gray },
          },
        },
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "" },
            right_padding = 2,
          }
        },
        lualine_b = {
          { "branch", icon = "" },
          "diff",
          "diagnostics"
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = {
              modified = " ●",
              readonly = " 🔒",
              unnamed  = " [No Name]",
              newfile  = " ✨",
            }
          }
        },
        lualine_x = {
          { "encoding", padding = { left = 1 } },
          "fileformat",
          "filetype"
        },
        lualine_y = { "progress" },
        lualine_z = {
          {
            "location",
            separator = { right = "" },
            left_padding = 2,
          }
        }
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" }
      },
      tabline = {},
      extensions = { "nvim-tree", "fzf" },
    })
  end,
}
