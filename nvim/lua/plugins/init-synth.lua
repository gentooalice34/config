-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- Тема (первой)
  {
    "artanikin/vim-synthwave84",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("synthwave84")
      
      -- ПЕРЕОПРЕДЕЛЯЕМ ФОН ПОСЛЕ ЗАГРУЗКИ ТЕМЫ
      vim.api.nvim_set_hl(0, "Normal", { bg = "#171529" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#171529" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#171529" })
      vim.api.nvim_set_hl(0, "Folded", { bg = "#1a1230" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "#171529" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "#171529" })
    end
  },
}
