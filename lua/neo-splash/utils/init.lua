local M = {}


function M.readlines(filepath)
  local fp = io.open(vim.fn.fnamemodify(filepath, ':p'), 'r')
  local lines = {}
  if fp == nil then return lines end
  for line in fp:lines() do lines[#lines+1] = line end
  fp:close()
  return lines
end


function M.get_splash_buf()
  local buf_in = vim.api.nvim_get_current_buf()
  local view_in = vim.fn.winsaveview()
  local buf_scratch = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf_scratch, 'bufhidden', 'wipe')

  vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    group = 'NeoSplash.lua',
    buffer = buf_scratch,
    callback = function ()
      vim.fn.getcharstr()

      vim.api.nvim_set_current_buf(buf_in)
      vim.fn.winrestview(view_in)
      vim.cmd('redraw')
    end
  })
  return buf_scratch
end


return M
