-- ~/.config/nvim/init.lua

-- Устанавливаем Lazy.nvim, если его нет
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- последняя стабильная версия
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Настройка клавиш (пример, пробел как лидер)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
-- Подключаем плагины из папки lua/plugins/
require("lazy").setup("plugins")
vim.cmd.colorscheme("gothic")
