-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  -- Загружаем после всего, но с высоким приоритетом
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSUpdate" },
  build = ":TSUpdate",
  config = function()
    -- Используем defer_fn для отложенной загрузки
    vim.defer_fn(function()
      local ok, treesitter = pcall(require, "nvim-treesitter.configs")
      if ok then
        treesitter.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "python" },
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },
        })
      else
        -- Если все еще не загрузилось, пробуем позже
        vim.schedule(function()
          local success, ts = pcall(require, "nvim-treesitter.configs")
          if success then
            ts.setup({
              ensure_installed = { "lua", "vim", "vimdoc", "python" },
              auto_install = true,
              highlight = { enable = true },
              indent = { enable = true },
            })
          end
        end)
      end
    end, 100) -- Задержка 100ms
  end,
}
