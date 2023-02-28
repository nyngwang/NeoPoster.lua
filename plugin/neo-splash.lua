if vim.fn.has("nvim-0.8") == 0 then
  return
end

if vim.g.loaded_neo_splash ~= nil then
  return
end

require('neo-splash')

vim.g.loaded_neo_splash = 1
