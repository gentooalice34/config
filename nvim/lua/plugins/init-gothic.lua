return {
  -- Kitty Theme (новая тема)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Конфигурация теперь в отдельном файле
    config = function()
      require("plugins.gothic")
    end,
  },
}
