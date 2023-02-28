local U = require('splash.utils')
local M = {}
vim.api.nvim_create_augroup('Splash.lua', { clear = true })
---------------------------------------------------------------------------------------------------

-- local yes, _, code = os.rename(target_path, target_path)
--   return yes or (code == 13)
---------------------------------------------------------------------------------------------------
function M.setup(opts)
  if not type(opts) then opts = {} end
  M.default_path = opts.default_path or nil

end


function M.splash(fp)
  if vim.fn.argc() > 0
    or vim.bo.filetype == 'gitcommit'
  then return end
  if fp == nil then fp = M.default_path end

  local lines = U.readlines(fp)
    if #lines == 0 then return end
  -- image info.
  local img_height = #lines
  local img_width = vim.fn.strdisplaywidth(lines[1])

  -- editor info.
  local editor = vim.api.nvim_list_uis()[1]
  local buf_splash = U.get_splash_buf()
  local left_padding = string.rep(' ', (editor.width - img_width)/2, '')
  local count_top_padding = (editor.height - img_height)/2

  for i = img_height, 1, -1 do
    vim.api.nvim_buf_set_lines(buf_splash, 0, 0, true, { left_padding .. lines[i] })
  end
  -- add top padding.
  for _ = 1, count_top_padding do
    vim.api.nvim_buf_set_lines(buf_splash, 0, 0, true, { '' })
  end

  vim.api.nvim_set_current_buf(buf_splash)
end


return M
