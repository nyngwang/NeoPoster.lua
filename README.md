<img src="https://neovim.io/logos/neovim-mark-flat.png" align="right" width="100" />

NeoSplash.lua
===

Always want to create one to show some ascii arts.
Found an ancient one but it's buggy in some edge cases,
and written in Vim Script.

So ... wheel reinvented!


## Preview

<img src="https://user-images.githubusercontent.com/24765272/222985745-07eb6b07-e9cc-421b-b294-3080428f9ecb.png" width="600">


## Setup

notes:
- `default_path`: will be used when calling `NeoSplash [{filepath}]`.
  - don't need to add quotes for `filepath` and `~` is allowed.
  - don't know how to support `<Tab>`-completion of `filepath`.😅 (PR welcome)


```lua
use {
  'nyngwang/NeoSplash.lua',
  config = function ()
    require('neo-splash').setup {
      -- change it to point to your own file.
      default_path = '~/.config/nvim/lua/ningwang/data/ascii_art/miku.txt'
    }
    -- show the splash on VimEnter but later.
    vim.api.nvim_create_autocmd({ 'UIEnter' }, {
      callback = function ()
        if vim.bo.buftype == '' then vim.cmd('NeoSplash') end
      end,
    })
  end
}
```


## Ref.

https://github.com/thinca/vim-splash
