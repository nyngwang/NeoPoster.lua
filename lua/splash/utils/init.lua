local M = {}


function M.readlines(filepath)
  local fp = io.open(vim.fn.fnamemodify(filepath, ':p'), 'r')
  local lines = {}
  if fp == nil then return lines end
  for line in fp:lines() do lines[#lines+1] = line end
  fp:close()
  return lines
end


return M
