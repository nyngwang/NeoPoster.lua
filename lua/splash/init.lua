local U = require('splash.utils')
local M = {}

---------------------------------------------------------------------------------------------------

-- local yes, _, code = os.rename(target_path, target_path)
--   return yes or (code == 13)

local fp = '~/.config/nvim/lua/ningwang/data/ascii_art/miku.txt'
local lines = U.readlines(fp)
print(#lines)
vim.pretty_print(lines)

---------------------------------------------------------------------------------------------------
function M.setup(opts)
  if not type(opts) then opts = {} end



end



return M
