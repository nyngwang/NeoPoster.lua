if vim.fn.has("nvim-0.8") == 0 then
  return
end

if vim.g.loaded_splash ~= nil then
  return
end

require('splash')

vim.g.loaded_splash = 1
