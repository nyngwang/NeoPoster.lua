local U = require('neo-splash.utils')
local A = require('neo-splash.utils.autocmds')
local M = {}
vim.api.nvim_create_augroup('Splash.lua', { clear = true })
---------------------------------------------------------------------------------------------------

-- local yes, _, code = os.rename(target_path, target_path)
--   return yes or (code == 13)
---------------------------------------------------------------------------------------------------
function M.setup(opts)
  if not type(opts) then opts = {} end
  M.default_path = opts.default_path or ''

  A.create_autocmds()
end


function M.neo_splash(opts)
  if vim.fn.argc() > 0
    or vim.bo.filetype == 'gitcommit'
  then return end

  local fp = #opts.args > 0 and opts.args or M.default_path

  local lines = U.readlines(fp)
    if #lines == 0 then return end
  -- image info.
  local img_height = #lines
  local img_width = vim.fn.strdisplaywidth(lines[1])

  -- loadee info.
  local win_width = vim.api.nvim_win_get_width(0)
  local win_height = vim.api.nvim_win_get_height(0)
  local buf_splash = U.get_splash_buf()
  local left_padding = string.rep(' ', (win_width - img_width)/2, '')
  local count_top_padding = (win_height - img_height)/2

  for i = img_height, 1, -1 do
    vim.api.nvim_buf_set_lines(buf_splash, 0, 0, true, { left_padding .. lines[i] })
  end
  -- add top padding.
  for _ = 1, count_top_padding do
    vim.api.nvim_buf_set_lines(buf_splash, 0, 0, true, { '' })
  end

  vim.api.nvim_buf_set_option(buf_splash, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf_splash, 'filetype', 'neo-splash')
  vim.api.nvim_set_current_buf(buf_splash)
end


local function setup_vim_commands()
  vim.api.nvim_create_user_command('NeoSplash', M.neo_splash, { nargs = '?' })
end
setup_vim_commands()


return M
