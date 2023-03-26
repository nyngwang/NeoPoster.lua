if vim.fn.has("nvim-0.8") == 0 then
  return
end

if vim.g.loaded_neo_poster ~= nil then
  return
end

require('neo-poster')

vim.g.loaded_neo_poster = 1
