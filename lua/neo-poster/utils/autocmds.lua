local M = {}


local function call_on_VimEnter()
  vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    group = 'NeoPoster.lua',
    pattern = '*',
    callback = function ()
      if vim.bo.filetype == '' then
        vim.cmd [[
          NeoPoster
          redraw
          doau BufEnter
        ]]
      end
    end
  })
end


function M.create_autocmds()
  if require('neo-poster').call_on_VimEnter then call_on_VimEnter() end
end


return M
