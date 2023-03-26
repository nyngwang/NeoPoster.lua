local U = require('neo-poster.utils')
local A = require('neo-poster.utils.autocmds')
local M = {}
vim.api.nvim_create_augroup('NeoPoster.lua', { clear = true })
---------------------------------------------------------------------------------------------------

-- local yes, _, code = os.rename(target_path, target_path)
--   return yes or (code == 13)
---------------------------------------------------------------------------------------------------
function M.setup(opts)
  if not type(opts) then opts = {} end
  M.default_path = opts.default_path or ''
  M.call_on_VimEnter = opts.call_on_VimEnter
    if not M.call_on_VimEnter then M.call_on_VimEnter = false end

  A.create_autocmds()
end


function M.neo_poster(opts)
  local fp = #opts.args > 0 and opts.args or M.default_path

  local lines = U.readlines(fp)
    if #lines == 0 then return end
  -- image info.
  local img_height = #lines
  local img_width = vim.fn.strdisplaywidth(lines[1])

  -- loadee info.
  local win_enter = vim.api.nvim_get_current_win()
  local win_width = vim.api.nvim_win_get_width(win_enter)
  local win_height = vim.api.nvim_win_get_height(win_enter)
  local buf_poster = U.get_poster_buf()
  local left_padding = string.rep(' ', (win_width - img_width)/2, '')
  local count_top_padding = (win_height - img_height)/2

  for i = img_height, 1, -1 do
    vim.api.nvim_buf_set_lines(buf_poster, 0, 0, true, { left_padding .. lines[i] })
  end
  -- add top padding.
  for _ = 1, count_top_padding do
    vim.api.nvim_buf_set_lines(buf_poster, 0, 0, true, { '' })
  end

  vim.api.nvim_buf_set_option(buf_poster, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf_poster, 'filetype', 'neo-poster')
  vim.defer_fn(function ()
    vim.api.nvim_win_set_buf(win_enter, buf_poster)
    vim.cmd('redraw')
  end, 50)
end


local function setup_vim_commands()
  vim.api.nvim_create_user_command('NeoPoster', M.neo_poster, { nargs = '?' })
end
setup_vim_commands()


return M
