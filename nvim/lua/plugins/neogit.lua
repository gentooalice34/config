return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- опционально
      "sindrets/diffview.nvim",        -- опционально
    },
    -- Рекомендуемая настройка: загружать плагин только при вызове команды.
    -- Это ускоряет запуск Neovim.
    cmd = "Neogit",
    -- Здесь можно задать пользовательские настройки
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        -- Ваши пользовательские настройки, если нужны.
        -- Если оставить пустым, будут использованы стандартные.
        -- Например, отключение подсказок в статус-баре:
        -- disable_hint = true,
        integrations = {
          telescope = true, -- Включить интеграцию с Telescope
          diffview = true,  -- Включить интеграцию с Diffview
        }
      })
    end,
    keys = {
      -- Пример привязки клавиш для открытия Neogit
      { "<leader>g", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    },
  },
}
