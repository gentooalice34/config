-- ~/.config/nvim/lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Палитра из colors.json (pywal)
    local colors = {
      bg      = "#0c0509",  -- background
      fg      = "#c2c0c1",  -- foreground
      dark_bg = "#0c0509",

      -- Акценты
      normal  = "#4c5a6e",  -- color3 (yellow/blue)
      insert  = "#374962",  -- color2 (green)
      visual  = "#827c7f",  -- color5 (magenta)
      replace = "#732a12",  -- color1 (red)
      command = "#be9b8a",  -- color6 (cyan)

      -- Дополнительные
      cyan    = "#be9b8a",
      white   = "#c2c0c1",
      gray    = "#675560",  -- color8
      accent  = "#795f4b",  -- color4
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
