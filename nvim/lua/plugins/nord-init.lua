-- ~/.config/nvim/lua/init.lua
return {
  -- Nord theme
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
    end
  },
  -- Другие плагины
}
